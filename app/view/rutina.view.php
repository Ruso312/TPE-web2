<?php

class RutinasView{

    public function mostrarRutinas($rutinas){
        $count = count($rutinas);

        require './templates/rutinas.phtml';
    }

    public function mostrarError($error){
        require './templates/error.phtml';
    }
}