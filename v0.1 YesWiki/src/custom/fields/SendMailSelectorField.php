<?php

namespace YesWiki\Custom\Field;

use Psr\Container\ContainerInterface;
use YesWiki\Bazar\Field\EnumField;
use YesWiki\Bazar\Service\FormManager;

/**
 * @Field({"sendmailselector"})
 */
class SendMailSelectorField extends EnumField
{
    protected $linkedLabel;        // 3
    protected $linkedLabelInForm;  // 4
    protected $subType;            // 7
    protected $formManager;
    protected $formId;
    protected $form;

    protected const FIELD_LINKED_LABEL = 3;
    protected const FIELD_LINKED_LABEL_IN_FORM = 4;
    protected const FIELD_SUB_TYPE = 7;
    protected const KEY_FOR_LIST = 'list' ;
    protected const KEY_FOR_FORM = 'form' ;

    public function __construct(array $values, ContainerInterface $services)
    {
        parent::__construct($values, $services);
        $this->size = null;
        $this->maxChars = null;
        $this->propertyName = $this->listLabel;
        $this->linkedLabel = $values[self::FIELD_LINKED_LABEL];
        $this->linkedLabelInForm = $values[self::FIELD_LINKED_LABEL_IN_FORM];
        $this->subType = $values[self::FIELD_SUB_TYPE];

        // load options
        $this->options = [];
        switch ($this->subType) {
            case self::KEY_FOR_LIST:
                $this->loadOptionsFromList();
                break;
            case self::KEY_FOR_FORM:
                $this->formId = intval($this->name);
                if ($this->formId < 1) {
                    $this->options['error'] = 'The name contains \'' . $this->formId . '\' but is not the id of a form : should be positive integer.';
                } else {
                    $this->loadOptionsFromEntries();
                    $this->formManager = $this->getService(FormManager::class);
                    $this->form = $this->formManager->getOne($this->formId);
                    if (empty($this->form)) {
                        $this->options['error'] = 'The name contains \'' . $this->formId . '\' but is not the id of an existing form.';
                    } else {
                        $template = $this->form['template'];
                        foreach($template as $id => $field) {}
                        $this->loadOptionsFromEntries();
                    }
                }
                break;
            default:
                $this->options['error'] = 'SubType \'' . $this->subType . '\' is not allowed.';
        }

        // add the linked label at the beginning
        if (!isset($this->options['error'])){
            $this->options = [$this->linkedLabel => ] + $this->options;
        } 
    }

    public function jsonSerialize()
    {
        return array_merge(
            parent::jsonSerialize(),
            [
                'linkedLabel' => $this->linkedLabel,
                'linkedLabelInForm' => $this->linkedLabelInForm,
                'subType' => $this->subType
            ]
        );
    }
}
