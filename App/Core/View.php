<?php

namespace App\Core;

class View
{
    protected $data = [];
    protected $template;

    public function __get($name)
    {
        return $this->data[$name];
    }

    public function assign($name, $value)
    {
        $this->data[$name] = $value;
    }

    public function display($template)
    {
        include __DIR__ . "/../Views/" . $template . ".tpl";
    }


    public function render($template)
    {
        ob_start();
        include __DIR__ . "/../Views/" . $template . ".tpl";
        $output = ob_get_contents();
        ob_end_flush();
        return $output;
    }

}
