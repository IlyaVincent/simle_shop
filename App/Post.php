<?php

namespace App;

class Post
{
    public $data;

    public function __construct()
    {
        $this->data[] = $_POST;
    }

    public function __get($name)
    {
        return $this->data[0][$name];
    }

}