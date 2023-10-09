<?php

class UserModel{
    private $db;

    function __construct(){
        $this->db = new PDO('mysql:host=localhost;dbname=gimnasio;charset=utf8','root','');
    }

    public function getByEmail($email){
        $query = $this->db->prepare('SELECT * FROM cliente WHERE email_cliente = ?');
        $query->execute([$email]);

        return $query->fetch(PDO::FETCH_OBJ);
    }
}