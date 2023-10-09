<?php

class PersonalModel{
    private $db;

    function __construct() {
        $this->db = new PDO('mysql:host=localhost;dbname=gimnasio;charset=utf8','root','');
    }

    function getByInstructorName($instructor){
        $query = $this->db->prepare('SELECT * FROM instructor WHERE nombre_instructor = ?');
        $query->execute([$instructor]);

        return $query->fetch(PDO::FETCH_OBJ);
    }
}