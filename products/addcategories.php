<?php
require_once '../inc/headers.php';
require_once '../inc/functions.php';

//Filtteroidaan POST-inputit (ei käytetä string-filtteriä, koska deprekoitunut)
    //Jos parametria ei löydy, funktio palauttaa null
    $categoryname = filter_input(INPUT_POST, "categoryname"); // onko frontin inputin id "categoryname" JA VOIKO OLLA INPUT_POST???????????

    if(isset($categoryname)) {
        try{
        addCategory($categoryname);
        } catch(Exception $e) {
        returnError($e); 
        }
    }

    function addCategory($categoryname) {
    
        //Tarkistetaan onko muttujia asetettu
        if (!isset($categoryname) || (empty($categoryname)) ) {
            throw new Exception("Kategorian nimeä ei ole syötetty. Kategoriaa ei voida lisätä");
        }
    
        try {
            $pdo = openDb();
            //Suoritetaan parametrien lisääminen tietokantaan.
            $sql = "INSERT INTO category (name) VALUES (?)";
            $statement = $pdo->prepare($sql);
            $statement->bindParam(1, $categoryname);
            $statement->execute();
        } catch (PDOException $e) {
            throw $e;
        }

    }

?>