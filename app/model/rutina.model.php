<?php

class RutinasModel{
    private $bd;

    function __construct(){
        $this->bd = new PDO('mysql:host=localhost;dbname=gimnasio;charset=utf8','root','');
    }

    function obtenerRutinas($id){
        if($id == 1){
            $query = $this->bd->prepare('SELECT * FROM rutina');
            $query->execute();
            $rutinas = $query->fetchAll(PDO::FETCH_OBJ);
            return $rutinas;
        }
        $query = $this->bd->prepare('SELECT * FROM rutina WHERE cliente_id = ?');
        $query->execute([$id]);

        $rutinas = $query->fetchAll(PDO::FETCH_OBJ);

        return $rutinas;
    }

    function cargarRutina($tren,$musculo,$ejercicio,$repeticiones,$series,$cliente_id){
        $query = $this->bd->prepare('INSERT INTO rutina (tren,musculo,ejercicio,repeticiones,series,cliente_id) VALUES(?,?,?,?,?,?)');
        $query->execute([$tren,$musculo,$ejercicio,$repeticiones,$series,$cliente_id]);
        
        return $this->bd->lastInsertId();
    }

    function eliminarRutina($id){
        $query = $this->bd->prepare('DELETE FROM rutina WHERE rutina_id = ?');
        $query->execute([$id]);
    }
}