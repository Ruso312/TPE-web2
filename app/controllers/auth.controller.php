<?php
require_once './app/views/auth.view.php';
require_once './app/models/auth.model.php';
require_once './app/helpers/auth.helper.php';

class AuthController{
    private $view;
    private $model;

    function __construct() {
        $this->model = new UserModel();
        $this->view = new AuthView();
    }

    public function showLogin(){
        $this->view->showLogin();
    }

    public function auth(){
        $email = $_POST['email'];
        $password = $_POST['password'];

        if(empty($email) || empty($password)){
            $this->view->showLogin('Faltan completar datos');
            return;
        }

        $user = $this->model->getByEmail($email);
        if($user && password_verify($password, $user->contraseña_cliente)){
            AuthHelper::login($user);
            header('Location: ' . BASE_URL);
        }
        else{
            $this->view->showLogin('Usuario invalido');
        }
    }

    public function logout(){
        AuthHelper::logout();
        header('Location: ' . BASE_URL);
    }
}
