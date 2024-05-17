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
    // Verificando se os dados foram recebidos corretamente do formulário
    if(isset($_POST['nome'], $_POST['email'], $_POST['senha'], $_POST['confirmar_senha'], $_POST['cpf'])) {
        
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

            // Agora vamos inserir os dados na tabela usuario

            // Dados recebidos do segundo formulário
            $telefone = $_POST['telefone'];
            $telefone_secundario = isset($_POST['segundo_telefone']) ? $_POST['segundo_telefone'] : '';
            $cep = $_POST['cep'];
            $endereco = $_POST['endereco'];
            $numero_residencia = $_POST['numero_residencia'];
            $complemento = isset($_POST['complemento']) ? $_POST['complemento'] : '';
            $bairro = $_POST['bairro'];
            $cidade = $_POST['cidade'];
            $estado = $_POST['estado'];

            // Inserindo dados na tabela usuario
            $sql_usuario = "INSERT INTO usuario (id_cadastro, telefone, telefone_secundario, cep, endereco, numero_residencia, complemento, bairro, cidade, estado) 
                    VALUES ('$id_cadastro', '$telefone', '$telefone_secundario', '$cep', '$endereco', '$numero_residencia', '$complemento', '$bairro', '$cidade', '$estado')";
            if ($conn->query($sql_usuario) === TRUE) {
                echo "Dados inseridos na tabela usuario com sucesso. <br>";
            } else {
                echo "Erro ao inserir dados na tabela usuario: " . $conn->error . "<br>";
            }
        } else {
            echo "Erro ao inserir dados na tabela cadastro: " . $conn->error . "<br>";
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
        $sql_receba_novidades = "INSERT INTO receba_novidades (nome, telefone, email) VALUES ('$nome_completo', '$telefone', '$email')";
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