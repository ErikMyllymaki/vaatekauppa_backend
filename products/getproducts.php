<?php

require_once '../inc/headers.php';
require_once '../inc/functions.php';

$uri = parse_url(filter_input(INPUT_SERVER, 'PATH_INFO'), PHP_URL_PATH);
$parameters = explode('/',$uri);
$category_id = $parameters[1];
$gender = $parameters[2];

try {

    // $query = null

    echo count($parameters);



    $db = openDb();
    $sql = "select * from category where id = $category_id";
    $query = $db->query($sql);
    $category = $query -> fetch(PDO::FETCH_ASSOC);


    // $sql2 = "";

    // if (cäount($parameters === 3)) {
    $sql = "select * from product where category_id = $category_id and gender = '$gender'";


    $query = $db->query($sql);
    $products = $query->fetchAll(PDO::FETCH_ASSOC);

    // $query = $db->query($sql);
    // $products = $query->fetchAll(PDO::FETCH_ASSOC);

    header('HTTP/1.1 200 OK');
    echo json_encode(array(
        "category" => $category['name'],
        "products" => $products
    ));
}
catch (PDOException $pdoex) {
    returnError($pdoex);
}