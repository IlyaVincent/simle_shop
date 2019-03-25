<?php

namespace App\Controllers;

use App\Models\ShopModel as Shop;

class ShopController
{
    public function ActionIndex()
    {
        $shop = new Shop();
        $product = $shop->getById(1);

        $template = new \App\Core\View();
        $template->assign('product', $product);
        $template->display('header');
        $template->display('main');
        $template->display('footer');
    }

    public function ActionCart()
    {
        $template = new \App\Core\View();
        $template->display('header');
        $template->display('cart');
        $template->display('footer');
    }
}
