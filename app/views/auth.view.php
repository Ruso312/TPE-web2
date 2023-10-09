<?php

class AuthView{
    public function showLogin($error = null){
        require'./templates/login.phtml';
    }
}