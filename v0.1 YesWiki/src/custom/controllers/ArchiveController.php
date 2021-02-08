<?php

namespace YesWiki\custom\Controllers;

use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;
use YesWiki\Core\YesWikiController;
use YesWiki\Core\Service\UserManager;

class ArchiveResponse
{
    private $readyToExport ;
    private $htmlReturn ;

    public function __construct(bool $readyToExport, string $htmlReturn)
    {
        $this->readyToExport = $readyToExport ;
        $this->htmlReturn = $htmlReturn ;
    }

    public function isReadyToExport(): bool
    {
        return $this->readyToExport ;
    }

    public function getHtmlReturn(): string
    {
        return $this->htmlReturn ;
    }
}

class ArchiveController extends YesWikiController
{
    protected $userManager;
    protected $params ;

    /**
     * LearnerDashboardController constructor
     * @param UserManager $userManager the injected UserManager instance
     */
    public function __construct(
        UserManager $userManager,
        ParameterBagInterface $params
    ) {
        $this->userManager = $userManager;
        $this->params = $params;
    }

    public function resolveArgument(array $args): ArchiveResponse
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
                    $buttonName = _t('CUSTOM_ARCHIVE_ACTION_EXPORT') . ' ' . _t('CUSTOM_ARCHIVE_ACTION_PAGES') ;
                    break;
                case 'forms':
                    $buttonName = _t('CUSTOM_ARCHIVE_ACTION_EXPORT') . ' ' . _t('CUSTOM_ARCHIVE_ACTION_FORMS') ;
                    break;
                case 'entries':
                    $buttonName = _t('CUSTOM_ARCHIVE_ACTION_EXPORT') . ' ' . _t('CUSTOM_ARCHIVE_ACTION_ENTRIES') ;
                    break;
                case 'sql':
                    $buttonName = _t('CUSTOM_ARCHIVE_ACTION_EXPORT') . ' ' . _t('CUSTOM_ARCHIVE_ACTION_SQL') ;
                    break;
                case 'filesAndCache':
                    $buttonName = _t('CUSTOM_ARCHIVE_ACTION_EXPORT') . ' ' . _t('CUSTOM_ARCHIVE_ACTION_FILES_AND_CACHE') ;
                    break;
                case 'site':
                    $buttonName = _t('CUSTOM_ARCHIVE_ACTION_EXPORT') . ' ' . _t('CUSTOM_ARCHIVE_ACTION_SITE') ;
                    break;
                default:
                    $buttonName = _t('BAZ_VALIDER') ;
                    $export = null ;
            }
            $download = false ;
            // check post data to confirm password
            if ($args['password_confirm']) {
                if ($this->userManager->getOneByName($userName, $args['password_confirm'])) {
                    // right password
                    if ($export) {
                        $download = true ;
                    }
                } else {
                    $args['password_confirm'] = null ;
                    $wrongPassword = true ;
                }
            }
            return new ArchiveResponse(
                $download,
                $this->render('@custom/archive.twig', [
                    'userName' => $userName,
                    'password_confirm' => $args['password_confirm'],
                    'wrongPassword' => $wrongPassword,
                    'buttonName' => $buttonName,
                    'export' => $export,
                    'download' => $download ?? false
                ])
            );
        } else {
            return new ArchiveResponse(
                false,
                $this->render('@custom/alert-message.twig', [
                    'alertMessage' => _t('CUSTOM_ARCHIVE_ACTION_RESERVED_TO_ADMIN')
                ])
            );
        }
    }
}
