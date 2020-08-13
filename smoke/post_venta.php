<?php
include_once ("cosas/headers.php");
use DBC\conexion as dbc;
require "vendor/autoload.php";
$postdata = file_get_contents("php://input");
$request = json_decode($postdata, true);


foreach ($request as $value):
    $a = $value-> nombre;
    $query = "CALL insert_products('" .$a. "' ,'" .$value['nombre']. "' , '" .$value['nombre']. "',
    '" .$value['precio']. "','" .$value['stock']. "', '" .$value['precio']. "', '" .$value['precio']. "');";
    $respuesta = dbc::registro($query) ;
    $info['status'] = $respuesta;
    echo json_encode($info);
endforeach;
echo json_encode($a);