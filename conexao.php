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
            // Configurações de conexão com o banco de dados
            $servername = "localhost";
            $username = "root";
            $password = "";
            $database = "login";

            // Dados recebidos do formulário
            $nome_completo = $_POST['nome'];
            $email = $_POST['email'];
            $senha = $_POST['senha'];
            $confirmar_senha = $_POST['confirmar_senha'];
            $cpf = $_POST['cpf'];
            $telefone = $_POST['telefone'];
            $telefone_secundario = $_POST['segundo_telefone'];
            $cep = $_POST['cep'];
            $endereco = $_POST['endereco'];
            $numero_residencia = $_POST['numero_residencia'];
            $complemento = $_POST['complemento'];
            $bairro = $_POST['bairro'];
            $cidade = $_POST['cidade'];
            $estado = $_POST['estado'];

            //var_dump($_POST);

            // Conexão com o banco de dados
            $conn = new mysqli($servername, $username, $password, $database);

            // Verifica conexão
            if ($conn->connect_error) {
                die("Conexão falhou: " . $conn->connect_error);
            }

            // Inserindo dados na tabela cadastro
            $sql = "INSERT INTO cadastro (nome_completo, cpf, email, senha) VALUES ('$nome_completo','$cpf', '$email', '$senha')";
            if ($conn->query($sql) === TRUE) {
                $id_cadastro = $conn->insert_id; // Obtém o ID gerado automaticamente
                echo "Dados inseridos na tabela cadastro com sucesso. ID do cadastro: " . $id_cadastro . "<br>";
            } else {
                echo "Erro ao inserir dados na tabela cadastro: " . $conn->error . "<br>";
            }

            // Inserindo dados na tabela usuario
            $sql = "INSERT INTO usuario (id_cadastro, telefone, telefone_secundario, cep, endereco, numero_residencia, complemento, bairro, cidade, estado) 
                    VALUES ('$id_cadastro', '$telefone', '$telefone_secundario', '$cep', '$endereco', '$numero_residencia', '$complemento', '$bairro', '$cidade', '$estado')";
            if ($conn->query($sql) === TRUE) {
                echo "Dados inseridos na tabela usuario com sucesso. <br>";
            } else {
                echo "Erro ao inserir dados na tabela usuario: " . $conn->error . "<br>";
            }

            // Fecha conexão com o banco de dados
            $conn->close();
        ?>
    </main>
</body>
</html>