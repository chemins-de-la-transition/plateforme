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
                    return $this->sendZipFromArray('export_pages.zip', $this->getPages()) ;
                    break;
                case 'entries':
                    return $this->sendZipFromArray('export_entries.zip', $this->getEntries()) ;
                    break;
                case 'forms':
                    return $this->sendZipFromArray('export_forms.zip', $this->getForms()) ;
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

    private function sendZipFromArray(string $zipName = "export.zip", array $data, string $comment = ''): string
    {
        $output = '' ;
        if (count($data) == 0) {
            $output = $this->render('@custom/alert-message.twig', [
                'alertMessage' => 'ALERT : empty date when trying to export ' . $zipName .' !'
            ]);
        } else {
            // create tempfile
            $tmp_file = tmpfile();
            $tmp_location = stream_get_meta_data($tmp_file)['uri']; //"location" of temp file
            // open file
            $zip = new ZipArchive;
            $res = $zip->open($tmp_location, ZipArchive::OVERWRITE);
            if ($res === TRUE) {
                foreach ($data as $fileName => $fileContent) {
                    $zip->addFromString($fileName, $fileContent);
                }
                $zip->close();
                $zipContent = file_get_contents($tmp_location) ;
                $zipSize = filesize($tmp_location);
                // delete tempfile
                fclose($tmp_file);

                //Set the Content-Type, Content-Disposition and Content-Length headers.
                header("Content-Type: application/zip");
                header("Content-Disposition: attachment; filename=$zipName");
                header("Content-Length: " . $zipSize );

                echo $zipContent ;

                exit;
                $output = 'ok';
            } else {
                // delete tempfile
                fclose($tmp_file);
                $output = $this->render('@custom/alert-message.twig', [
                        'alertMessage' => 'Error when creating zipArchive object'
                    ]);
            }
        }
        // render return with header
        $output = $this->wiki->Header() . $output ;
        $output .= $this->wiki->Footer() ;
        return $output ;
    }
}
