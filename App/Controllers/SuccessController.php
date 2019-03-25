<?php

namespace App\Controllers;

class SuccessController
{
    public function ActionIndex()
    {
        $template = new \App\Core\View();
        $template->display('header');
        $template->display('success');
        $template->display('footer');
    }
}
