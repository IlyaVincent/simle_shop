<?php

namespace App\Models;

use App\Core\Model;

class CategoriesModel extends Model
{

    const TABLE = 'categories';

    public $id;
    public $name;
    public $color;


    function getCategories()
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
}