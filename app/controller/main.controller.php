<?php

require_once './app/view/main.view.php';

class MainController{
    private $view;

    function __construct(){
        $this->view = new MainView();
    }

    public function verMain(){
        $this->view->verMain();
    }
}