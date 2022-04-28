<?php
require_once '../inc/headers.php';
require_once '../inc/functions.php';

try {
    $db = openDb();
    selectAsJson($db, 'select * from sizes');
}
catch (PDOException $pdoex){
    returnError($pdoex);
}