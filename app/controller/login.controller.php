<?php

require_once './app/model/login.model.php';
require_once './app/view/login.view.php';
require_once './app/helper/login.helper.php';

class LoginController{
    private $view;
    private $model;

    function __construct(){
        $this->model = new LoginModel();
        $this->view = new LoginView();
    }

    public function mostrarLogin(){
        $this->view->mostrarLogin();
    }

    public function verificar(){
        $email = $_POST['email'];
        $password = $_POST['password'];


        if(empty($email) || empty($password)){
            $this->view->mostrarLogin("Faltan completar datos");
            return;
        }

        $cliente = $this->model->checkEmail($email);
        if($cliente && $password == ($cliente->contraseña)){
            LoginHelper::login($cliente);

            header('Location: ' . BASE_URL . 'main');
        }

        else{
            $this->view->mostrarLogin("Usuario inválido");
        }
    }

    public function desloguear(){
        LoginHelper::logout();
        header('Location: ' . BASE_URL);
    }
}