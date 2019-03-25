<?php

namespace App\Core;

use App\Post;

class Route
{
    protected $controllerName = 'Main';
    protected $actionName = 'Index';
    protected $routes;
    protected $controllerFile;
    protected $controllerPath;

    public function __construct()
    {
        $this->routes = explode('/', $_SERVER['REQUEST_URI']);
    }

    public function start()
    {
        if (!empty($this->routes[1])) {
            $this->controllerName = ucfirst($this->routes[1]);
        }
        if (!empty($this->routes[2])) {
            $this->actionName = ucfirst($this->routes[2]);
        }
        if (strripos($this->routes[1], "id") !== false) {
            $this->controllerName = "Products";
        }

        $this->controllerName .= 'Controller';
        $this->actionName = 'Action' . $this->actionName;
        $this->controllerFile = $this->controllerName . '.php';
        $this->controllerPath = __DIR__ . "/../Controllers/" . $this->controllerFile;

        $this->createController();
    }

    /**
     * Создание страницы 404 и вывод ошибок
     * @param $e
     */
    public function ErrorPage404($e)
    {
//        $host = 'http://' . $_SERVER['HTTP_HOST'] . '/';
         header('HTTP/1.1 404 Not Found');
         header("Status: 404 Not Found");
        $template = new View();
        $template->assign('error', $e);
        $template->display('header');
        $template->display('404');
        $template->display('footer');

        die();
    }

    /**
     * Создание контроллера
     */
    public function createController()
    {
        $controllerClass = "App\Controllers\\" . $this->controllerName;
        $action = $this->actionName;
        try {
            if (!method_exists($controllerClass, $action)) {
                throw new \Exception('Данной страницы не существует!');
            }
        } catch (\Exception $e) {
            (new Route())->ErrorPage404($e->getMessage());
        }
        $controller = new $controllerClass();
        $controller->$action();
    }

    /**
     * Обработка $_POST
     */
    public function checkPost()
    {
        $post = new Post();
        $this->controllerName = ucfirst($post->name) . 'Controller';
        $this->actionName = 'Action' . ucfirst($post->name);
        $this->createController();
    }

}


