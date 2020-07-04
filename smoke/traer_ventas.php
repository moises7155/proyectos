<?php
//include_once ("cosas/headers.php");
//use DBC\conexion as dbc;
//require "vendor/autoload.php";
$server = "localhost";
$user = "root";
$password = "";
$bd = "smoke";

$mysqli = new mysqli ($server, $user, $password, $bd) or die ("error") ;
if($mysqli->connect_errno){
    echo $mysqli->connect_errno;
    echo $mysqli->connect_error;
}
$sql = "Select SUM(t1.importe) total, MONTH(t2.fecha_venta) mes, YEAR(t2.fecha_venta) anio 
FROM Producto_has_ventas t1 JOIN ventas t2 ON t1.ventas_id = t2.id 
GROUP By MONTH(t2.fecha_venta), YEAR(t2.fecha_venta) ORDER BY YEAR(t2.fecha_venta) ASC";
//$rows = dbc::consultas($query);
$rows = $mysqli->query($sql);
//echo json_encode(['data'=> $rows]);
if($rows){

    $meses = [1 => "Enero", 2 => "Febrero", 3 => "Marzo", 4 => "Abril", 5 => "Mayo", 6 => "Junio",
        7 => "Julio", 8 => "Agosto", 9 => "Septiembre", 10 => "Octubre", 11 => "Noviembre", 12 => "Diciembre"];


    $data = ['Enero'=>0, 'Febrero'=>0, 'Marzo'=>0, 'Abril'=>0, 'Mayo'=>0, 'Junio'=>0, 'Julio'=>0,
        'Agosto'=>0, 'Septiembre'=>0, 'Octubre'=>0, 'Noviembre' => 0, 'Diciembre' => 0];

    $data2 = ['Enero'=>0, 'Febrero'=>0, 'Marzo'=>0, 'Abril'=>0, 'Mayo'=>0, 'Junio'=>0, 'Julio'=>0,
        'Agosto'=>0, 'Septiembre'=>0, 'Octubre'=>0, 'Noviembre'=> 0, 'Diciembre' => 0];

    foreach($rows as $row):
        $mesNum = $row['mes'];
        $row['mes'] = $meses[$mesNum];
        $data[$row['mes']] = $row['total'];


        $group[$row['anio']] = $data;
        $anios[] = $row['anio'];

    endforeach;

    $arrayAnios = array_unique($anios);
    for($i = reset($arrayAnios); $i <= end($arrayAnios); $i++) {
        $resultAnios[] = (String)$i;
    }

    foreach ($resultAnios as $a):
        if(!isset($group[$a])) {
            $result[] = ["name" => $a, "data"=>array_values($data2)];
        } else {
            $result[] = ["name" => $a, "data"=>array_values($group[$a])];
        }

    endforeach;
    $fp = fopen('ventas.json', 'w');
    fwrite ($fp, json_encode($result));
    fclose($fp);
}
//$archivo['ventas'] = $rows;