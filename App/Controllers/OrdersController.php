<?php

namespace App\Controllers;

use App\Models\CategoriesModel;
use App\Models\OrdersModel;
use App\Models\ShopModel;

class OrdersController
{
    public function ActionIndex()
    {
        $orders = new OrdersModel();
        $orders = $orders->getOrders();

        $categories = new CategoriesModel();
        $categories = $categories->getCategories();

        $shop = new ShopModel();
        $products = $shop->getProducts();

        $template = new \App\Core\View();
        $template->display('header');
        $template->assign('categories', $categories);
        $template->assign('orders', $orders);
        $template->assign('products', $products);
        $template->display('orders');
        $template->display('footer');
    }
}
