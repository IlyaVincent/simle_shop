<?php

namespace App\Models;

use App\Core\Model;

class ShopModel extends Model
{

    const TABLE = 'products';

    public $id;
    public $name;
    public $categoryId;
    public $description;
    public $stock;
    public $href;


    function getProducts()
    {
        $db = new \App\Db();
        $sql = "SELECT * FROM " . static::TABLE . " ORDER BY id";
        return $db->query($sql, self::class);
    }

    function getById($id)
    {
        $db = new \App\Db();
        $sql = "SELECT * FROM " . static::TABLE . " WHERE id=:id";
        return $db->query($sql, self::class, array(':id' => $id));
    }

    public function setAmount($id, $amount)
    {
        $db = new \App\Db();
        $sql = "UPDATE " . static::TABLE . " SET stock = :stock WHERE id=:id";
        return $db->execute($sql, array(':stock' => $amount, ':id' => $id));
    }

}
