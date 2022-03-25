<?php
require_once 'inc/header.php';
require_once 'inc/functions.php';

try {
    $db = openDb();
    selectAsJson($db, 'select * from category');
}
catch (PDOException $pdoex){
    returnError($pdoex);
}