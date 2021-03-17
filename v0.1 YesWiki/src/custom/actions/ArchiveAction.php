<?php

use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;
use YesWiki\Bazar\Service\EntryManager;
use YesWiki\Bazar\Service\FormManager;
use YesWiki\Core\YesWikiAction;
use YesWiki\Core\Service\DbService;
use YesWiki\Core\Service\PageManager;
use YesWiki\Core\Service\UserManager;

class ArchiveAction extends YesWikiAction
{
    private $readyToExport ;
    private $htmlReturn ;
    private $userManager ;
    private $dBService ;

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
        $this->readyToExport = false;
        $this->htmlReturn = '';
        $this->userManager = $this->getService(UserManager::class) ;
        $this->resolveArgument($this->arguments) ;
        if ($this->readyToExport) {
            return $this->exportFile() . $this->htmlReturn ;
        }
        return $this->htmlReturn ;
    }

    
    private function resolveArgument(array $args)
    {
        $userName = $this->userManager->getLoggedUserName() ;
        if ($this->userManager->getLoggedUser() != '' && $this->params->has('archive_authotized_users')
                && ($authorized_users = $this->params->get('archive_authotized_users'))
                && is_array($authorized_users) && in_array($userName, $authorized_users)) {
            $wrongPassword = false ;
            
            // select mode
            $export = $args['export'] ?? $args['export_param'] ?? null ;
            switch ($export) {
                case 'pages':
                case 'forms':
                case 'entries':
                case 'sql':
                case 'filesAndCache':
                case 'site':
                case 'custom':
                    break;
                default:
                    $export = null ;
            }
            // check post data to confirm password
            if ($args['password_confirm']) {
                if ($this->userManager->getOneByName($userName, $args['password_confirm'])) {
                    // right password
                    if ($export) {
                        $this->readyToExport = true ;
                    }
                } else {
                    $args['password_confirm'] = null ;
                    $wrongPassword = true ;
                }
            }

            $this->htmlReturn = $this->render('@custom/archive.twig', [
                'userName' => $userName,
                'password_confirm' => $args['password_confirm'],
                'wrongPassword' => $wrongPassword,
                'export' => $export,
                'download' => $this->readyToExport ?? false
            ]);
        } else {
            $this->htmlReturn = $this->render(
                '@templates/alert-message.twig',
                [
                    'type' => 'danger',
                    'message' => _t('CUSTOM_ARCHIVE_ACTION_RESERVED_TO_ADMIN')
                ]
            );
        }
    }

    private function exportFile()
    {
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
                return $this->sendZipFromArray('export_sql.sql.zip', $this->getSql()) ;
                break;
            case 'filesAndCache':
                return $this->sendZipFiles('export_filesAndCache.zip', 'filesAndCache') ;
                break;
            case 'site':
                return $this->sendZipFiles('export_site.zip', 'site') ;
                break;
            case 'custom':
                return $this->sendZipFiles('export_custom.zip', 'custom') ;
                break;
            default:
                $output = $this->render(
                    '@templates/alert-message.twig',
                    [
                        'type' => 'danger',
                        'message' => _t('CUSTOM_ARCHIVE_ACTION_OPTION') . '\'' .
                                $this->arguments['export'] . '\'' . _t('CUSTOM_ARCHIVE_ACTION_OPTION_NOT_DEFINED')
                    ]
                );
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
            $title = str_replace(array_merge(
                array_map('chr', range(0, 31)),
                array('<', '>', ':', '"', '/', '\\', '|', '?', '*')
            ), '', $title);
            $results['Form '. $id . ' - ' . $title . '.txt'] = $template ;
        }
        return $results ;
    }

    private function sendZipFromArray(string $zipName = "export.zip", array $data, string $comment = ''): string
    {
        $output = '' ;
        if (count($data) == 0) {
            $output = $this->render(
                '@templates/alert-message.twig',
                [
                'type' => 'danger',
                'message' => 'ALERT : empty date when trying to export ' . $zipName .' !'
            ]
            );
        } else {
            // create tempfile
            $tmp_location = tempnam(sys_get_temp_dir(), 'zipArchive') ;
            // open file
            $zip = new ZipArchive;
            $res = $zip->open($tmp_location, ZipArchive::CREATE |  ZipArchive::OVERWRITE);
            if ($res === true) {
                try {
                    foreach ($data as $fileName => $fileContent) {
                        if ($zip->getFromName($fileName) !== false) {
                            $zip->deleteName($fileName) ;
                        }
                        $zip->addFromString($fileName, $fileContent);
                    }
                    $zip->close();
                    $zipContent = file_get_contents($tmp_location) ;
                    $zipSize = filesize($tmp_location);
                    // delete tempfile
                    unlink($tmp_location);
                    // to prevent existing headers because of handlers /show or others
                    while (ob_get_level() > 0) {
                        ob_end_clean();
                    }

                    //Set the Content-Type, Content-Disposition and Content-Length headers.
                    header("Content-Type: application/zip");
                    header("Content-Disposition: attachment; filename=$zipName");
                    header("Content-Length: " . $zipSize);

                    echo $zipContent ;

                    exit;
                    $output = 'ok';
                } catch (Throwable $t) {
                    // catch errors
                    header("Content-Type: text/html; charset=$charset");
                    $output =  _t('PERFORMABLE_ERROR') . "<br/>" . $t->getMessage() . ' in <i>' . $t->getFile();
                    $output .=  '</i> on line <i>' . $t->getLine() . '</i><br/>' ;

                    return $this->render(
                        '@templates/alert-message.twig',
                        ['type' => 'danger','message' => $output]
                    );
                }
            } else {
                // delete tempfile
                fclose($tmp_file);
                $output = $this->render(
                    '@templates/alert-message.twig',
                    [
                        'type' => 'danger',
                        'message' => 'Error when creating zipArchive object'
                    ]
                );
            }
        }
        return $output ;
    }

    private function getSQL(): array
    {
        $this->dbService = $this->getService(DbService::class) ;

        $tablesPrefix = $this->dbService->prefixTable('');
        $tablesPostfix = [];
        // get Tables
        $tables = $this->dbService->loadAll("show tables");
        if (!is_array($tables)) {
            return ['error.log' => 'Error in Archive->getSQL() : show tables do not return an array !'];
        }
        foreach ($tables as  $tableInfo) {
            if (!is_array($tableInfo)) {
                return ['error.log' => 'Error in Archive->getSQL() : $tableInfo should be an array !'];
            }
            $tablesPostfix[] = array_values($tableInfo)[0];
        }

        // generate file

        $sqlFile = '';
        // HEADER
        $sqlFile .= '-- SQL Dump' . "\n" ;
        $sqlFile .= '-- ArchiveAction Version' . "\n" ;
        $sqlFile .= '-- ' . "\n" ;
        $sqlFile .= '-- Generated on : '. (new \DateTime())->format('c') . "\n" ;
        $sqlFile .= '-- PHP version : '. phpversion() . "\n" ;
        $sqlFile .= "\n" ;
        $sqlFile .= 'SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";'."\n" ;
        $sqlFile .= 'SET AUTOCOMMIT = 0;'."\n" ;
        $sqlFile .= 'START TRANSACTION;'."\n" ;
        $sqlFile .= 'SET time_zone = "+00:00";'."\n" ;
        $sqlFile .= "\n" ;
        $sqlFile .= "\n" ;
        $sqlFile .= '/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;'."\n" ;
        $sqlFile .= '/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;'."\n" ;
        $sqlFile .= '/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;'."\n" ;
        $sqlFile .= '/*!40101 SET NAMES utf8mb4 */;'."\n" ;
        $sqlFile .= "\n" ;
        $sqlFile .= '-- --------------------------------------------------------' . "\n" ;
        $sqlFile .= "\n" ;
        $sqlFile .= "\n" ;

        
        // For each table
        foreach ($tablesPostfix as $tableName) {
            // DUMP CREATE TABLE

            //    HEADER
            $sqlFile .= '-- ' . "\n" ;
            $sqlFile .= '-- Structure of table : `' . $tableName . "`\n" ;
            $sqlFile .= '-- ' . "\n" ;
            $sqlFile .= "\n" ;

            $createTableResult = $this->dbService->query("show create table " . $tableName);

            while ($creationTable = mysqli_fetch_array($createTableResult)) {
                $sqlFile .= $creationTable[1].";\n\n";
            }

            // DUMP DATA

            //    HEADER
            $sqlFile .= '-- ' . "\n" ;
            $sqlFile .= '-- Data of table : `' . $tableName . "`\n" ;
            $sqlFile .= '-- ' . "\n" ;
            $sqlFile .= "\n" ;

            $rawData = $this->dbService->query("select * from " . $tableName);

            $firstRow = true ;
            while ($row = mysqli_fetch_array($rawData)) {
                if ($firstRow) {
                    $sqlFile .= "INSERT INTO `".$tableName."` ";
                    $sqlFile .= "(";
                    for ($i=0; $i < mysqli_num_fields($rawData); $i++) {
                        if ($i != 0) {
                            $sqlFile .=  ", ";
                        }
                        $sqlFile .= "`" . mysqli_fetch_field_direct($rawData, $i)->name . "`";
                    }
                    $sqlFile .= ") VALUES\n";
                    $firstRow = false ;
                } else {
                    $sqlFile .= ",\n";
                }
                $sqlFile .= "(";
                for ($i=0; $i < mysqli_num_fields($rawData); $i++) {
                    if ($i != 0) {
                        $sqlFile .=  ", ";
                    }
                    $strAdd = '';
                    $field = mysqli_fetch_field_direct($rawData, $i);
                    if ($field->type == 252 // text or blob cf https://www.php.net/manual/fr/mysqli-result.fetch-field-direct.php
                        || $field->type == 253 // varchar
                        || $field->type == 254 // char
                        || $field->type == 10 // date
                        || $field->type == 11 // time
                        || $field->type == 12 // datetime
                        || $field->type == 13 // year
                        ) {
                        $strAdd =  "'";
                    }
                    $sqlFile .=  $strAdd . addslashes($row[$i]) . $strAdd ;
                }
                $sqlFile .=  ")";
            }
            $sqlFile .= ";\n" ;
            $sqlFile .= "\n" ;
            $sqlFile .= '-- --------------------------------------------------------' . "\n" ;
            $sqlFile .= "\n" ;
        }

        $sqlFile .= 'COMMIT;'."\n" ;

        $sqlFile .= '/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;'."\n" ;
        $sqlFile .= '/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;'."\n" ;
        $sqlFile .= '/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;'."\n" ;

        return [ 'yeswiki_database.sql' =>  $sqlFile] ;
    }

    private function sendZipFiles(string $zipName = "export.zip", string $type = 'site'): string
    {
        $path = dirname(__FILE__, 3); // /custom/actions/../../
        if (substr($path, -1) != '/') {
            $path.= '/';
        }
        $dirnamePathLen = strlen($path) ;
        switch ($type) {
            case 'custom':
                $path .= 'custom/' ;
                $dirs = [$path];
                break;
            case 'filesAndCache':
                $dirs = [$path . 'files/', $path . 'cache/'];
                break;
            case 'site':
            default:
                $dirs = [$path];
        }

        $output = '' ;
        // create tempfile
        $tmp_location = tempnam(sys_get_temp_dir(), 'zipArchive') ;
        // open file
        $zip = new ZipArchive;
        $res = $zip->open($tmp_location, ZipArchive::CREATE |  ZipArchive::OVERWRITE);
        if ($res === true) {
            try {
                while (count($dirs)) {
                    $dir = current($dirs);
                    if (substr($dir, -1) != '/') {
                        $dir.= '/';
                    }
                    if (basename($dir) != "vendor") {
                        $baseDirName = substr($dir, $dirnamePathLen);
                        if (!empty($baseDirName)) {
                            $zip->addEmptyDir($baseDirName);
                        }
                        $dh = opendir($dir);
                        while (false !== ($file = readdir($dh))) {
                            if ($file != '.' && $file != '..') {
                                if (is_file($dir.$file)) {
                                    $zip->addFile($dir.$file, $baseDirName.$file);
                                } elseif (is_dir($dir.$file)) {
                                    $dirs[] = $dir.$file."/";
                                }
                            }
                        }
                        closedir($dh);
                    }
                    array_shift($dirs);
                }
                $zip->close();
                $zipContent = file_get_contents($tmp_location) ;
                $zipSize = filesize($tmp_location);
                // delete tempfile
                unlink($tmp_location);
                // to prevent existing headers because of handlers /show or others
                while (ob_get_level() > 0) {
                    ob_end_clean();
                }

                //Set the Content-Type, Content-Disposition and Content-Length headers.
                header("Content-Type: application/zip");
                header("Content-Disposition: attachment; filename=$zipName");
                header("Content-Length: " . $zipSize);

                echo $zipContent ;

                exit;
                $output = 'ok';
            } catch (Throwable $t) {
                // catch errors
                header("Content-Type: text/html; charset=$charset");
                $output =  _t('PERFORMABLE_ERROR') . "<br/>" . $t->getMessage() . ' in <i>' . $t->getFile();
                $output .=  '</i> on line <i>' . $t->getLine() . '</i><br/>' ;

                return $this->render(
                    '@templates/alert-message.twig',
                    ['type' => 'danger','message' => $output]
                );
            }
        } else {
            // delete tempfile
            fclose($tmp_file);
            $output = $this->render(
                '@templates/alert-message.twig',
                [
                    'type' => 'danger',
                    'message' => 'Error when creating zipArchive object'
                ]
            );
        }
        return $output ;
    }
}
