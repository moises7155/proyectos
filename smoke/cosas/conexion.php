<?php
namespace DBC;
class conexion
{
    protected static function conn(){
        $servername = "localhost";
        $username = "root";
        $password = "";
        $dbname = "smoke";
        return mysqli_connect($servername, $username, $password, $dbname);
    }
    public static function verificar(){
        if(self::conn()->connect_errno){
            print_r("Error de coenxión");
            return false;
        }else{
            return true;
        }
    }
    public static function consulta($query){
        $resultado = mysqli_query(self::conn(), $query);
        $pass = mysqli_fetch_object($resultado);
          return $pass;
    }
    public static function registro($query){
        $db = self::conn();
        $respuesta = $db->query($query);
        return $respuesta;
    }
    public static function consultas($query){
        $resultado = mysqli_query(self::conn(), $query);
        while ($row = mysqli_fetch_object($resultado)){
            $pass[]=$row;
        }
        return $pass;
    }
    public static function eliminar($query){
        $db = self::conn();
        $respuesta = $db->query($query);
        return $respuesta;
    }

}
