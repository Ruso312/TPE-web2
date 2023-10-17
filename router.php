<?php

require_once './app/controller/main.controller.php';
require_once './app/controller/rutina.controller.php';
require_once './app/controller/login.controller.php';

define('BASE_URL','//'.$_SERVER['SERVER_NAME'].':'.$_SERVER['SERVER_PORT'].dirname($_SERVER['PHP_SELF']).'/');

$action = 'main';
if(!empty($_GET['action'])){
    $action = $_GET['action'];
}

$params = explode('/', $action);


switch ($params[0]){
    case 'main':
        LoginHelper::verify();
        $controller = new MainController();
        $controller->verMain();
        break;
    case 'rutinas':
        LoginHelper::verify();
        $controller = new RutinasController();
        $controller->mostrarRutinas();
        break;
    case 'cargar':
        LoginHelper::verify();
        $controller = new RutinasController();
        $controller->cargarRutina();
        break;
    case 'eliminar':
        LoginHelper::verify();
        $controller = new RutinasController();
        $controller->eliminarRutina($params[1]);
    case 'login':
        $controller = new LoginController();
        $controller->mostrarLogin();
        break;
    case 'verificar':
        $controller = new LoginController();
        $controller->verificar();
        break;
    case 'desloguear':
        $controller = new LoginController();
        $controller->desloguear();
        break;
    default:
        echo"404 Page Not Found";
        break;
}