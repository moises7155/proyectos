<?php
include_once ("cosas/headers.php");
use DBC\conexion as dbc;
require "vendor/autoload.php";
$postdata = file_get_contents("php://input");
$request = json_decode($postdata);
@$codigo_barras = $request -> codigo_barras;
    $query = " Select * FROM producto where id = '".$codigo_barras."'" ;

    $rows = dbc::consultas($query);
echo json_encode($rows);

