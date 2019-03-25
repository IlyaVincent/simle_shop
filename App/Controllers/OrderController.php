<?php

namespace App\Controllers;

use App\Models\CartModel;
use App\Models\CategoriesModel;
use App\Models\OrdersModel;
use App\Models\ShopModel;
use App\Post;

class OrderController
{
    public function ActionIndex()
    {
        $cart = new CartModel();
        $productsCart = $cart->getProducts();

        $shop = new ShopModel();
        $products = $shop->getProducts();

        $categories = new CategoriesModel();
        $categories = $categories->getCategories();


        $template = new \App\Core\View();
        $template->assign('productsCart', $productsCart);
        $template->assign('products', $products);
        $template->assign('categories', $categories);
        $template->display('header');
        $template->display('order');
        $template->display('footer');
    }

    public function ActionOrder()
    {
        $cart = new CartModel();
        $productsCart = $cart->getProducts();

        $post = new Post();
        $orders = new OrdersModel();
        $orders->saveOrder($post->username, $post->tel, json_encode($productsCart));
        $cart->cartFree();
    }
}
