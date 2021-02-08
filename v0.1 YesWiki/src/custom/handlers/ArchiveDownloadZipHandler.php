<?php

use YesWiki\Bazar\Service\EntryManager;
use YesWiki\Bazar\Service\FormManager;
use YesWiki\Core\YesWikiHandler;
use YesWiki\Core\Service\PageManager;
use YesWiki\custom\Controllers\ArchiveController;

class ArchiveDownloadZipHandler extends YesWikiHandler
{
    public function formatArguments($arg)
    {
        return [
            'export_param' => $arg['export'] ?? null ,
            'export' => $_GET['export'] ?? $_POST['export'] ?? null ,
            'password_confirm' => (isset($_POST['password_confirm'])) ? md5($_POST['password_confirm']) : ($_POST['password_confirm_md5'] ?? null)
        ];
    }

    public function run()
    {
        $response = $this->getService(ArchiveController::class)->resolveArgument($this->arguments) ;
        if ($response->isReadyToExport()) {
            switch ($this->arguments['export']) {
                case 'pages':
                    return $this->sendZip('export_pages.zip', $this->getPages()) ;
                    break;
                case 'entries':
                    return $this->sendZip('export_entries.zip', $this->getEntries()) ;
                    break;
                case 'forms':
                    return $this->sendZip('export_forms.zip', $this->getForms()) ;
                    break;
                case 'sql':
                    // $this-sendZip($this->getSQL()) ;
                    // break;
                case 'filesAndCache':
                    // $this->sendZip($this->getFilesAndCache()) ;
                    // break;
                case 'site':
                    // $this->sendZip($this->getSite()) ;
                    // break;
                default:
                    $output = $this->wiki->Header() ;
                    $output .= $this->render('@custom/alert-message.twig', [
                            'alertMessage' => _t('CUSTOM_ARCHIVE_ACTION_OPTION') . '\'' . $this->arguments['export'] . '\'' . _t('CUSTOM_ARCHIVE_ACTION_OPTION_NOT_DEFINED')
                        ]);
                    $output .= $this->wiki->Footer() ;
                    return $output ;
            }
        } else {
            $output = $this->wiki->Header() ;
            $output .= $response->getHtmlReturn() ;
            $output .= $this->wiki->Footer() ;
            return $output ;
        }
    }

    private function getPages(): array
    {
        $pageManager = $this->getService(PageManager::class) ;
        $entryManager = $this->getService(EntryManager::class) ;
        $pages = $pageManager->getAll() ;
        $results = [] ;
        foreach ($pages as $page) {
            $tag = $page['tag'] ;
            $body = $page['body'] ;
            if (!$entryManager->isEntry($tag)) {
                $results[$tag . '.txt'] = $body ;
            }
        }
        return $results ;
    }
    
    private function getEntries(): array
    {
        $pageManager = $this->getService(PageManager::class) ;
        $entryManager = $this->getService(EntryManager::class) ;
        $pages = $pageManager->getAll() ;
        $results = [] ;
        foreach ($pages as $page) {
            $tag = $page['tag'] ;
            $body = $page['body'] ;
            if ($entryManager->isEntry($tag)) {
                $results[$tag . '.txt'] = $body ;
            }
        }
        return $results ;
    }

    
    private function getForms(): array
    {
        $formManager = $this->getService(FormManager::class) ;
        $forms = $formManager->getAll() ;
        $results = [] ;
        foreach ($forms as $form) {
            $id = $form['bn_id_nature'] ;
            $template = $form['bn_template'] ;
            $title = $form['bn_label_nature'] ;
            $results['Form '. $id . ' - ' . $title . '.txt'] = $template ;
        }
        return $results ;
    }

    private function sendZip(string $zipName = "export.zip", array $data, string $comment = ''): string
    {
        // Don't let the timeout cut the connection
        // if ($unlimitedTime === true)
        set_time_limit(0);

        if (!$data && !is_array($data) && count($data) == 0) {
            return 'no result' ;
        }

        // Reset global counters
        $centralDir = '';
        $currLength = 0 ;
        $currFileCount = 0 ;

        // Set headers
        header('Last-Modified: ' . gmdate('D, d M Y H:i:s', time()) . ' GMT', true, 200);
        header('Content-Type: ' . 'application/zip');
        header('Content-Disposition: inline; filename="' . $zipName . '"');

        foreach ($data as $fileName => $fileContent) {
            $size = strlen($fileContent);
            $filetime = time();
            $hash = strrev(str_pad(hash("crc32b", $fileContent, true), 4, "\x00", STR_PAD_LEFT));

            // Send header
            $head = $this->GetHeader($fileName, $size, $filetime, $hash);
            echo($head);

            // Send raw data
            echo($fileContent);

            // Cache central directory
            $centralDir = $this->GetCentralDirEntry($fileName, $size, $filetime, $hash, $currLength, [], $comment) ;

            // Adjust length
            $currLength += strlen($head) + $size;
            $currFileCount++;
        }

        // Send central directory
        echo($centralDir);

        // Send end of central directory
        $eof = $this->GetEndOfCentralDir($currFileCount, strlen($centralDir), $currLength, $currFileCount, 0, 0, $comment);
        echo($eof);
        
        flush();
    }

    /**
     * Creates a file entry header
     *
     * @param string $name      The name of the file including its relative path
     * @param int    $size      The file size
     * @param int    $time      The last modification time of the file as unix timestamp
     * @param string $hash      The CRC-32 cecksum (4 bytes raw)
     * $param array  $extraData Additional file attributes {
     *            string $key       The 2 byte identifier
     *            string $value     The attributes
     * }
     *
     */
    private function GetHeader($name, $size, $time, $hash, $extraData = [])
    {
        $nlen = strlen($name);
        if ($nlen > 0xFFFF) {
            throw new Exception('The name exceeds the maximum length of 65535 bytes!');
        }

        $extra = '';
        foreach ($extraData as $key => $val) {
            if (strlen($key) != 2) {
                throw new Exception('Extra data keys must be 2 bytes long!');
            }
            $l = strlen($val);
            if ($l > 65531) {
                throw new Exception('Extra data value exceeds the maximum length of 65531 bytes!');
            }
            $extra .= $key . $this->GetUInt16($l) . $val;
        }
        $elen = strlen($extra);
        if ($elen > 0xFFFF) {
            throw new Exception('Extra Part exceedes the maximum length of 65535 bytes!');
        }

        $head  = "PK\x03\x04"; // Signature
        $head .= "\x0A\x00"; // Version 0.10
        $head .= "\x00\x08"; // Flags (0x0800: UTF-8 file names)
        $head .= "\x00\x00"; // Compression method (00: none)
        $head .= $this->DateTimeToString($time); // Modification time and date
        $head .= $hash; // CRC32 hash
        $head .= $this->GetUInt32($size); // Compressed size
        $head .= $this->GetUInt32($size); // Un-compressed size
        $head .= $this->GetUInt16($nlen); // Filename length
        $head .= $this->GetUInt16($elen); // Extra data length
        $head .= $name; // Filename
        $head .= $extra; // Extra data fields
        
        return $head;
    }

    /**
     * Creates a file entry for the central directory
     *
     * @param string $name      The name of the file including its relative path
     * @param int    $size      The file size
     * @param int    $time      The last modification time of the file as unix timestamp
     * @param string $hash      The CRC-32 cecksum (4 bytes raw)
     * @param int    $offset    The offset in the file where the header of the file starts
     * $param array  $extraData Additional file attributes {
     *            string $key       The 2 byte identifier
     *            string $value     The attributes
     * }
     * @param string $comment   An optional file comment
     * @param int    $disk      The index of the disk the file is on
     *
     */
    private function GetCentralDirEntry($name, $size, $time, $hash, $offset, $extraData = [], $comment = '', $disk = 0)
    {
        $nlen = strlen($name);
        if ($nlen > 0xFFFF) {
            throw new Exception('The name exceeds the maximum length of 65535 bytes!');
        }

        $extra = '';
        foreach ($extraData as $key => $val) {
            if (strlen($key) != 2) {
                throw new Exception('Extra data keys must be 2 bytes long!');
            }
            $l = strlen($val);
            if ($l > 65531) {
                throw new Exception('Extra data value exceeds the maximum length of 65531 bytes!');
            }
            $extra .= $key . $this->GetUInt16($l) . $val;
        }
        $elen = strlen($extra);
        if ($elen > 0xFFFF) {
            throw new Exception('Extra Part exceedes the maximum length of 65535 bytes!');
        }
        
        $clen = strlen($comment);
        if ($clen > 0xFFFF) {
            throw new Exception('The comment exceedes the maximum length of 65535 bytes!');
        }
        
        $head  = "PK\x01\x02"; // Signature
        $head .= "\x3F\x00"; // OS version
        $head .= "\x0A\x00"; // Version needed
        $head .= "\x00\x08"; // Flags (0x0800: UTF-8 file names)
        $head .= "\x00\x00"; // Compression method (00: none)
        $head .= $this->DateTimeToString($time); // Modification time and date
        $head .= $hash; // CRC32 hash
        $head .= $this->GetUInt32($size); // Compressed size
        $head .= $this->GetUInt32($size); // Un-compressed size
        $head .= $this->GetUInt16($nlen); // Filename length
        $head .= $this->GetUInt16($elen); // Extra data length
        $head .= $this->GetUInt16($clen); // Comment length
        $head .= $this->GetUInt16($disk); // Disk
        $head .= "\x00\x00"; // Internal attributes
        $head .= "\x00\x00\x00\x00"; // External attributes
        $head .= $this->GetUInt32($offset);
        $head .= $name; // Filename
        $head .= $extra; // Extra data fields
        $head .= $comment; // File comment
        
        return $head;
    }

    /**
     * Creates an end-of-central-directory entry
     *
     * @param int    $fileCount The number of files in the central directory on this disk
     * @param int    $size      The length of the central directory
     * @param int    $offset    The offset of the central directory in this file
     * @param int    $totalFileCount The total number of files in the central directory
     * @param int    $disk      The disk index this central directory is on
     * @param int    $startDisk The disk index on which the central directory starts
     * @param string $comment   An optional comment for the ZIP file
     *
     *
     */
    private function GetEndOfCentralDir($fileCount, $size, $offset, $totalFileCount = null, $disk = 0, $startDisk = 0, $comment = '')
    {
        if ($totalFileCount === null) {
            $totalFileCount = $filecount;
        }
        
        $clen = strlen($comment);
        if ($clen > 0xFFFF) {
            throw new Exception('The comment exceedes the maximum length of 65535 bytes!');
        }
        
        $data  = "PK\x05\x06"; // Signature
        $data .= $this->GetUInt16($disk); // Index of this disk
        $data .= $this->GetUInt16($startDisk); // Index of disk where this central dir starts
        $data .= $this->GetUInt16($fileCount); // The number of file entries in this central directory on this disk
        $data .= $this->GetUInt16($totalFileCount); // The total number of file entries in this central dir
        $data .= $this->GetUInt32($size); // The size of the central dir
        $data .= $this->GetUInt32($offset); // The offset where the directory starts (on the according disk)
        $data .= $this->GetUInt16($clen); // Length of the comment
        $data .= $comment;
        
        return $data;
    }

    /** Converts a unix timestamp to its little endian binary MSDOS representation */
    private function DateTimeToString($val = null)
    {
        if ($val === null) {
            $val = time();
        }
        // Bits: YYYYYYYmmmmddddd HHHHHiiiiiisssss -> to bytes as little endian
        $parts = explode(',', date('H,i,s,Y,m,d', $val));
        $time = (intval($parts[0]) << 11) | (intval($parts[1]) << 5) | (intval($parts[2]) >> 1);
        $date = ((intval($parts[3]) - 1980) << 9) | (intval($parts[4]) << 5) | intval($parts[5]);
        return $this->GetUInt16($time) . $this->GetUInt16($date);
    }

    /** Converts a 16 bit unsigned number to its little endian binary representation */
    private function GetUInt16($val)
    {
        return chr($val & 0xFF) . chr(($val & 0xFF00) >> 8);
    }

    /** Converts a 32 bit unsigned number to its little endian binary representation */
    private function GetUInt32($val)
    {
        return chr($val & 0xFF) . chr(($val & 0xFF00) >> 8) . chr(($val & 0xFF0000) >> 16) . chr(($val & 0xFF000000) >> 24);
    }

    /* function that create zip Archive from data
     * $data = [
     *   'finename.ext' => 'content as text',...
     * ];
     * return ZipArchive|null
     */
    private function createZipArchive(array $data) :?ZipArchive
    {
        $zip = new ZipArchive() ;//Create an object from the ZipArchive class.
        $zipArchive = new ZipArchive();
        
        //The full path to where we want to save the zip file.
        $zipFilePath = '/home/data/example.zip';
        
        //Call the open function.
        $status = $zipArchive->open($zipFilePath, ZipArchive::CREATE);
        
        
        //An array of files that we want to add to our zip archive.
        //You should list the full path to each file.
        $filesToAdd = array(
            '/home/data/image.png',
            '/home/data/test.jpg'
        );
        
        //Add our files to the archive by using the addFile function.
        foreach ($filesToAdd as $fileToAdd) {
            //Add the file in question using the addFile function.
            $zipArchive->addFile($fileToAdd);
        }
        
        //Finally, close the active archive.
        $zipArchive->close();
        
        //Get the basename of the zip file.
        $zipBaseName = basename($zipFilePath);
        
        //Set the Content-Type, Content-Disposition and Content-Length headers.
        header("Content-Type: application/zip");
        header("Content-Disposition: attachment; filename=$zipBaseName");
        header("Content-Length: " . filesize($zipFilePath));
        
        //Read the file data and exit the script.
        readfile($zipFilePath);
        exit;
        // https://www.php.net/manual/fr/class.ziparchive.php
    }
}
