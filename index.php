<?php

require_once __DIR__ . '/app/autoload.php';

$route = new \App\Core\Route();

if ($_POST) {
    $route->checkPost();
} else {
    $route->start();
}
