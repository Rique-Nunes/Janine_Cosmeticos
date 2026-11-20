
<?php
$host = getenv('DB_HOST') ?: "127.0.0.1";
$usuario = getenv('DB_USER') ?: "root";
$senha = getenv('DB_PASSWORD') !== false ? getenv('DB_PASSWORD') : "";
$banco = getenv('DB_NAME') ?: "janine_comercios";
$port = (int)(getenv('DB_PORT') ?: 3306);

$con = new mysqli($host, $usuario, $senha, $banco, $port);

if ($con->connect_error) {
    die("Erro na conexão: " . $con->connect_error);
}

$con->set_charset("utf8mb4");
?>
