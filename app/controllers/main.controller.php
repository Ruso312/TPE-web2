<?php
require_once './app/views/main.view.php';

class MainController{
    private $view;

    function __construct(){
        $this->view = new MainView;
    }

    public function showMain(){
        $this->view->showMain();
    }
        
}


