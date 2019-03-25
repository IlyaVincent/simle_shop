<?php

namespace App\Controllers;

use App\Models\CategoriesModel;
use App\Models\ShopModel;

class ProductsController
{
    public function ActionIndex()
    {
        $productId = substr(explode('/', $_SERVER['REQUEST_URI'])[1], 2);
        $productId = $productId == '' ? 0 : $productId;

        $shop = new ShopModel();
        $products = $shop->getProducts();
        $product = $shop->getById($productId);

        $categories = new CategoriesModel();
        $categories = $categories->getCategories();

        $template = new \App\Core\View();
        $template->assign('product', $product);
        $template->assign('categories', $categories);
        $template->display('header');

        if (isset($products[$productId - 1])) {
            $template->display('product');
        } else {
            $template->display('empty');
        }

        $template->display('footer');
    }
}