<?php
require_once '../inc/headers.php';
require_once '../inc/functions.php';

try {
    $db = openDb();
    selectAsJson($db, 'select * from shoesizes');
}
catch (PDOException $pdoex){
    returnError($pdoex);
}