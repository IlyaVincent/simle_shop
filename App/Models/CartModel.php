<?php

namespace App\Models;

use App\Core\Model;

class CartModel extends Model
{

    const TABLE = 'cart';

    public $id;
    public $productId;
    public $amount;


    public function getProducts()
    {
        $db = new \App\Db();
        $sql = "SELECT * FROM " . static::TABLE . " ORDER BY id";
        return $db->query($sql, self::class);
    }

    public function addToCart($id, $residue)
    {
        $db = new \App\Db();
        $sql = "INSERT INTO " . static::TABLE . " (productId, amount) VALUES (:id, :amount)";
        return $db->execute($sql, array(':id' => $id, ':amount' => $residue));
    }

    public function cartFree()
    {
        $db = new \App\Db();
        $sql = "TRUNCATE TABLE " . static::TABLE;
        return $db->query($sql, self::class);
    }

}