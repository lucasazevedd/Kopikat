<?php
session_start();
// Configurações de conexão com o banco de dados
$servername = "localhost";
$username = "root";
$password = "";
$database = "login";

// Tentativa de conexão
$conn = new mysqli($servername, $username, $password, $database);

// Verifica se houve um erro de conexão
if ($conn->connect_error) {
    die("Conexão falhou: " . $conn->connect_error);
}

// Verifica se o formulário foi submetido
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtém os valores dos campos do formulário
    $email = $_POST['email'];
    $senha = $_POST['senha'];

    // Previne SQL Injection
    $email = $conn->real_escape_string($email);
    $senha = $conn->real_escape_string($senha);

    // Consulta ao banco de dados
    $sql = "SELECT * FROM cadastro WHERE email = '$email' AND senha = '$senha'";
    $result = $conn->query($sql);

    // Verifica se a consulta retornou algum resultado
    if ($result->num_rows > 0) {
        // Obtém os dados do usuário
        $usuario = $result->fetch_assoc();
        $_SESSION['email'] = $email;
        $_SESSION['senha'] = $senha;
        header("Location: home-page.php");
        exit();
    } else {
        // Se as credenciais estão incorretas, redireciona para a página de login
        unset($_SESSION['email']);
        unset($_SESSION['senha']);
        header("Location: login.html");
        exit();
    }
}

// Fecha a conexão
$conn->close();
?>
