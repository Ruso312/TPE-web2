<?php

class LoginHelper {

    public static function init() {
        if (session_status() != PHP_SESSION_ACTIVE) {
            session_start();
        }
    }

    public static function login($cliente) {
        LoginHelper::init();
        $_SESSION['CLIENTE_ID'] = $cliente->id;
        $_SESSION['CLIENTE_EMAIL'] = $cliente->email;
    }

    public static function logout() {
        LoginHelper::init();
        session_destroy();
    }

    public static function verify() {
        LoginHelper::init();
        if (!isset($_SESSION['CLIENTE_ID'])) {
            header('Location: ' . BASE_URL . '/login');
            die();
        }
    }
}
