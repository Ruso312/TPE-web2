<?php

require_once './app/model/rutina.model.php';
require_once './app/view/rutina.view.php';

class RutinasController{
    private $view;
    private $model;
    
    function __construct() {
        $this->view = new RutinasView;
        $this->model = new RutinasModel;
    }
    
    public function mostrarRutinas(){

        $rutinas = $this->model->obtenerRutinas($_SESSION['CLIENTE_ID']);

        $this->view->mostrarRutinas($rutinas);
    }

    public function cargarRutina(){
        $tren = $_POST['tren'];
        $musculo = $_POST['musculo'];
        $ejercicio = $_POST['ejercicio'];
        $repeticiones = $_POST['repeticiones'];
        $series = $_POST['series'];
        $cliente_id=$_SESSION['CLIENTE_ID'];

        if(empty($tren)||empty($musculo)||empty($ejercicio)||empty($repeticiones)||empty($series)){
            $this->view->mostrarError("Se deben completar todos los campos");
            return;
        }

        $id = $this->model->cargarRutina($tren,$musculo,$ejercicio,$repeticiones,$series,$cliente_id);
        if($id){
            header('Location: ' . BASE_URL . '/rutinas');
        }
        else{
            $this->view->mostrarError("No se pudo cargar la rutina");
        }
    }

    function eliminarRutina($id){
        $this->model->eliminarRutina($id);
        header('Location: ' .BASE_URL . '/rutinas');
    }
}