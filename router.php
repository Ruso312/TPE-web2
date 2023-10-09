<?php

require_once './app/controllers/auth.controller.php';
require_once './app/controllers/main.controller.php';
require_once './app/controllers/personal.controller.php';

define('BASE_URL','//'.$_SERVER['SERVER_NAME'].':'.$_SERVER['SERVER_PORT'].dirname($_SERVER['PHP_SELF']).'/');

$action = 'listar';
if(!empty($_GET['action'])){
    $action = $_GET['action'];
}

$params = explode('/', $action);

switch ($params[0]){
    case 'main':
        $controller = new MainController();
        $controller->showMain();
        break;
    case 'personal':
        $controller = new PersonalController();
        $controller->showPersonal();
        break;
    case 'login':
        $controller = new AuthController();
        $controller->showLogin();
        break;
    case 'auth':
        $controller = new AuthController();
        $controller->auth();
        break;
    case 'logout':
        $controller = new AuthController();
        $controller->logout();
        break;
    default:
    echo "404 Page Not Found";
    break;
}