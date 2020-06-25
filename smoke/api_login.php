<?php
include_once ("cosas/headers.php");
use DBC\conexion as dbc;
use aut\authToken as Token;
require "vendor/autoload.php";
//include_once ('authToken.php');

$postdata = file_get_contents("php://input");
$post = json_decode($postdata);

@$email = $post->email;
@$password = $post->password;
$query = "SELECT id, email, password FROM usuarios WHERE email = '".$email."' ";
$row = dbc::consulta($query);


if(password_verify($password, $row->password)){
    $token = Token::obtenerToken([
        'id' => $row->id,
        'name' => $row->email,
    ]);
    $dataProvaider=['success'=>1,'token'=>$token];
    echo json_encode($dataProvaider, JSON_UNESCAPED_UNICODE);
}else{
    echo json_encode(['success'=>0],JSON_UNESCAPED_UNICODE);
}

