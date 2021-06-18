<?php

if (!defined("WIKINI_VERSION")) {
    die("acc&egrave;s direct interdit");
}

echo $this->Action('bazarpost',0,array_merge($this->parameter,['calledBy' => 'bazar__']));
