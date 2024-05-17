<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Resultado do Assine</title>
</head>
<body>
    <header>
        <h1>Resultado do Processamento</h1>
    </header>
    <main>
    <?php
    
    if(isset($_POST['nome'], $_POST['email'], $_POST['telefone'])) {
        
        // Configurações de conexão com o banco de dados
        $servername = "localhost";
        $username = "root";
        $password = "";
        $database = "login";
    
        // Dados recebidos do formulário
        $nome_completo = $_POST['nome'];
        $email = $_POST['email'];
        $telefone = $_POST['telefone'];
    
        // Conexão com o banco de dados
        $conn = new mysqli($servername, $username, $password, $database);
    
        // Verifica conexão
        if ($conn->connect_error) {
            die("Conexão falhou: " . $conn->connect_error);
        }

        // Inserindo dados na tabela receba_novidades
        $sql_receba_novidades = "INSERT INTO receba_novidades (nome, celular, email) VALUES ('$nome_completo', '$telefone', '$email')";
        if ($conn->query($sql_receba_novidades) === TRUE) {
            $id_novidades = $conn->insert_id; // Obtém o ID gerado automaticamente
            echo "Dados inseridos na tabela cadastro com sucesso. ID do cadastro: " . $id_novidades . "<br>";
        } else {
            echo "Erro ao inserir dados na tabela usuario: " . $conn->error . "<br>";
        }
        
        // Fecha conexão com o banco de dados
        $conn->close();
    } else {
        // Se os dados do formulário não forem recebidos corretamente, exiba uma mensagem de erro
        echo "Erro: Dados do formulário não recebidos corretamente.";
    }
        // Redireciona para a página inicial (index.html)
        header("Location: home-page.html");
        exit; // Certifique-se de sair após o redirecionamento
?>
    </main>
</body>
</html>