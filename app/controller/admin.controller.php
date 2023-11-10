<?php

require_once './app/model/rutina.model.php';
require_once './app/view/rutina.view.php';

class AdminController{
    private $view;
    private $model;

    function __construct(){
        $this->view = new RutinasView;
        $this->model = new RutinasModel;
    }

    public function mostrarAdmin(){
        $rutinas = $this->model->obtenerRutinas($_SESSION['CLIENTE_ID']);

        $this->view->vistaAdmin($rutinas);
    }

    function eliminarRutina($id){
        $this->model->eliminarRutina($id);
        header('Location: ' .BASE_URL . '/admin');
    }
}