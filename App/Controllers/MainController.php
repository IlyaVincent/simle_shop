<?php

namespace App\Controllers;

use App\Models\CategoriesModel;

class MainController
{
    public function ActionIndex()
    {
        $shop = new \App\Models\ShopModel();
        $products = $shop->getProducts();

        $categories = new CategoriesModel();
        $categories = $categories->getCategories();

        $template = new \App\Core\View();
        $template->assign('products', $products);
        $template->assign('categories', $categories);
        $template->display('header');
        $template->display('main');
        $template->display('footer');
    }

}
