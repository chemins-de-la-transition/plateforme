<?php

use YesWiki\Core\YesWikiAction;
use YesWiki\custom\Controllers\ArchiveController;

class ArchiveAction extends YesWikiAction
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
        return $this->getService(ArchiveController::class)->resolveArgument($this->arguments)->getHtmlReturn() ;
    }
}
