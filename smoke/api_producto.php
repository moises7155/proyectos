<?php
include_once ("cosas/headers.php");
use DBC\conexion as dbc;
require "vendor/autoload.php";

$query = "SELECT * FROM producto";
$rows = dbc::consultas($query);
echo json_encode( $rows);