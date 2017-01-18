<?php
header('Content-Type: text/txt; charset=utf-8');
$server="localhost";
$BD="cine";
$user="root";
$password="";
$vdirector = $_REQUEST['codigoD'];

//Creamos la conexión
$conexion = mysqli_connect($server,$user,$password,$BD) or die("error en la conexión");

//generamos la consulta
$sql = "select * from peliculas where codigoD='$vdirector' order by codigoD;";

mysqli_set_charset($conexion, "utf8"); //formato de datos utf8

if(!$resultado = mysqli_query($conexion, $sql)) die();

$peliculas = array(); //creamos un array

while($row = mysqli_fetch_array($resultado)) 
{ 
    $codigoPel=$row['codigoPel'];
    $nacionalidad=$row['nacionalidad'];
    $productora=$row['productora'];
    $codigoD=$row['codigoD'];

    $peliculas[] = array('codigoPel'=> $codigoPel, 'nacionalidad'=> $nacionalidad, 'productora'=> $productora, 'codigoD'=> $codigoD);

}



/*
while ($row=mysqli_fetch_array($resultado))
{
  $peliculas[]=$row;
}
*/


    
//desconectamos la base de datos
$close = mysqli_close($conexion) 
or die("Ha sucedido un error inexperado en la desconexion de la base de datos");
  

//Creamos el JSON
$json_string = json_encode($peliculas);
echo $json_string;

//Si queremos crear un archivo json, sería de esta forma:
/*
$file = 'peliculas.json';
file_put_contents($file, $json_string);
*/

?>