<?php
require_once '../inc/headers.php';
require_once '../inc/functions.php';


try {
    $db = openDb();
    selectAsJson($db, 'select * from product where category_id = 3');
}
catch (PDOException $pdoex){
    returnError($pdoex);
}