<?php

require_once '../inc/headers.php';
require_once '../inc/functions.php';

$uri = parse_url(filter_input(INPUT_SERVER, 'PATH_INFO'), PHP_URL_PATH);
$parameters = explode('/',$uri);
$category_id = $parameters[1];
$gender = $parameters[2];
$price = $parameters[3];

try {
    $db = openDb();
    $sql = "select * from category where id = $category_id";
    $query = $db->query($sql);
    $category = $query -> fetch(PDO::FETCH_ASSOC);

    if ($gender === 'M' || $gender === 'N') {
        $sql = "select * from product where category_id = $category_id and gender = '$gender'";
        if ($price > 0 && $price < 9999)  {
            $sql = "select * from product where category_id = $category_id and gender = '$gender' and price <= $price";
        }

    }
    else if ($gender > 0 && $gender < 10000) {
        $sql = "select * from product where id = $gender";
        
    }
    else {
        $sql = "select * from product where category_id = $category_id";
        if ($price > 0 && $price < 9999) {
            $sql = "select * from product where category_id = $category_id and price <= $price";
        }
    }

    $query = $db->query($sql);
    $products = $query->fetchAll(PDO::FETCH_ASSOC);

    header('HTTP/1.1 200 OK');
    echo json_encode(array(
        "category" => $category['name'],
        "products" => $products
    ));
}
catch (PDOException $pdoex) {
    returnError($pdoex);
}