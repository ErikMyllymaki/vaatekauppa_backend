
<?php
 require_once '../inc/headers.php';
 require_once '../inc/functions.php';

$input = json_decode(file_get_contents('php://input'));
$name = filter_var($input->name, FILTER_SANITIZE_SPECIAL_CHARS);

try {
$db = openDb();

$query = $db->prepare('insert into category(name) values (:name)');
$query->bindValue(':name',$name,PDO::PARAM_STR);
$query->execute();

header('HTTP/1.1 200 OK');
$data = array('id' => $db->lastInsertId(), 'name' => $name);
print json_encode($data);
} catch (PDOException $pdoex) {
    header('HTTP/1.1 500 Internal Server Error');
    $error = array('error' => $pdoex->getMessage());
    print json_encode($error);
}

