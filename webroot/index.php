<?php


function mb_ucfirst($str) {
    $fc = mb_strtoupper(mb_substr($str, 0, 1));
    return $fc.mb_substr($str, 1);
}


define('DS', DIRECTORY_SEPARATOR);
define('ROOT', dirname(dirname(__FILE__)));
define('VIEWS_PATH', ROOT.DS.'views');
define('PAGES_PATH', VIEWS_PATH.DS.'pages');

require_once(ROOT.DS.'lib'.DS.'init.php');

session_start();


App::run($_SERVER['REQUEST_URI']);
