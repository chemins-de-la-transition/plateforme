<?php

use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;
use YesWiki\Bazar\Service\EntryManager;
use YesWiki\Bazar\Service\FormManager;
use YesWiki\Core\YesWikiAction;
use YesWiki\Core\Service\PageManager;
use YesWiki\Core\Service\UserManager;

class ArchiveAction extends YesWikiAction
{
    private $readyToExport ;
    private $htmlReturn ;
    private $userManager ;

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
            $this->htmlReturn = $this->render('@custom/alert-message.twig', [
                    'alertMessage' => _t('CUSTOM_ARCHIVE_ACTION_RESERVED_TO_ADMIN')
                ]);
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
                // $this-sendZip($this->getSQL()) ;
                // break;
            case 'filesAndCache':
                // $this->sendZip($this->getFilesAndCache()) ;
                // break;
            case 'site':
                // $this->sendZip($this->getSite()) ;
                // break;
            default:
                $output = $this->render('@custom/alert-message.twig', [
                        'alertMessage' => _t('CUSTOM_ARCHIVE_ACTION_OPTION') . '\'' . $this->arguments['export'] . '\'' . _t('CUSTOM_ARCHIVE_ACTION_OPTION_NOT_DEFINED')
                    ]);
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
            $output = $this->render('@custom/alert-message.twig', [
                'alertMessage' => 'ALERT : empty date when trying to export ' . $zipName .' !'
            ]);
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
                    return $this->render('@custom/alert-message.twig', [
                        'alertMessage' => $output
                    ]);
                }
            } else {
                // delete tempfile
                fclose($tmp_file);
                $output = $this->render('@custom/alert-message.twig', [
                        'alertMessage' => 'Error when creating zipArchive object'
                    ]);
            }
        }
        return $output ;
    }
}
