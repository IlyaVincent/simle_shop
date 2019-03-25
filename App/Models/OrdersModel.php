<?php

namespace App\Models;

use App\Core\Model as Model;

class OrdersModel extends Model
{

    const TABLE = 'orders';

    public $id;
    public $name;
    public $tel;
    public $cart;

    public function getOrders()
    {
        $db = new \App\Db();
        $sql = "SELECT * FROM " . static::TABLE . " ORDER BY id";
        $orders = $db->query($sql, self::class);
        return $this->setCart($orders);
    }

    public function saveOrder($name, $tel, $cart)
    {
        $db = new \App\Db();
        $sql = "INSERT INTO " . static::TABLE . " (name, tel, cart) VALUES (:name, :tel, :cart)";
        return $db->execute($sql, array(':name' => $name, ':tel' => $tel, ':cart' => $cart));
    }

    public function setCart($orders)
    {
        for ($i = 0; $i < count($orders); $i++) {
            $orders[$i]->cart = json_decode($orders[$i]->cart);
        }
        return $orders;
    }

}