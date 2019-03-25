<?php

namespace App\Controllers;

use App\Models\CartModel;
use App\Models\CategoriesModel;
use App\Models\ShopModel;
use App\Post;

class CartController
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

        if (empty($productsCart)) {
            $template->display('cart-free');
        } else {
            $template->display('cart');
        }

        $template->display('footer');
    }

    public function ActionCart()
    {
        $cart = new CartModel();
        $post = new Post();
        $cart->addToCart($post->id, $post->amount);

        $shop = new ShopModel();
        $product = $shop->getById($post->id);
        $amount = $product[0]->stock - $post->amount;
        $shop->setAmount($post->id, $amount);
    }
}
