<?php
require_once './app/models/personal.model.php';
require_once './app/views/personal.view.php';

class PersonalController{
    private $view;
    private $model;

    function __construct() {
        $this->view = new PersonalView;
        $this->model = new PersonalModel;
    }

    public function showPersonal(){
        $this->view->showPersonal();
    }
}