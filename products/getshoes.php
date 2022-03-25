<?php
require_once '../inc/headers.php';
require_once '../inc/functions.php';


try {
    $db = openDb();
    selectAsJson($db, 'select * from tuote where kategoria_id = 3');
}
catch (PDOException $pdoex){
    returnError($pdoex);
}