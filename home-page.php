<?php
session_start(); // Inicia a sessão

// Verifica se as variáveis de sessão estão definidas
if (!isset($_SESSION['email']) || !isset($_SESSION['senha'])) {
    // Se não estão definidas, redireciona para a página de login
    header('Location: login.html');
    exit;
}

$logado = $_SESSION['email'];
?>


<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kopikat</title>
    <!--CSS-->
    <link rel="stylesheet" href="style.css">
    <!--Fontes Utilizadas-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200..1000;1,200..1000&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200..1000;1,200..1000&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <!--favicon-->
    <link rel="shortcut icon" type="image/png" href="/fotos/icon-logo[16x16].png">
</head>
<body>

    <div id="header-container">
        <header id="Barra">
            <nav> 
                <div class="logo">
                    <a href="home-page.php">
                        <img id="icon" src="fotos/icon-logo.png" alt="icon">         
                    </a>
                    <a href="home-page.php">
                        <img id="name" src="fotos/kopikat-name-bg-preto.png" alt="Frame_6">         
                    </a>
                </div>
                <ul class="nav-links">
                    <li><a href="#como-funciona">como funciona?</a></li>
                    <li><a href="#quem-somos">quem somos?</a></li>
                </ul>

                <div class="nav-buttons">
                    <a href="logout.php" class="nav-button">Deslogar</a>
                </div>
                </div>
            </nav>
        </header>
    </div>
    
    <!--Garantir responsividade-->
    <section class="featured-section">
        <div class="text-container">
          <h1 id="headline">O seu café nunca mais vai ser como antes</h1>
          <p id="descricao_headline">Experimente um mundo novo de experiências com o café da <strong>kopikat</strong></p>
          <a href="#como-funciona" class="btn">Saiba mais</a>
        </div>
        <div class="image-container">
            <img src="fotos/icon-logo.png" alt="">
        </div>
    </section>

    <!--Terminar de preencher os espaços-->
    <!--Definir altura e largura fixos, porém relativos a tela-->
    <!--Garantir responsividade-->
    <section id="como-funciona" class="section2">
        <h1 id="headline2">COMO FUNCIONA?</h1>

        <ul class="cards">
            <li>
                <div>
                    <img class="fotos" src="fotos/GATO_PRETO.png" alt="gatocafe">
                    <h3 class="instrucoes">assine</h3>
                    <p class="descricao_cards">e receba uma caixa mensalmente com grãos de café de diferentes partes do mundo</p>
                </div>
            </li>
            <li>
                <div>
                    <img class="fotos" src="fotos/gatto-preto-caixa.png" alt="gatocaixa">
                    <h3 class="instrucoes">receba</h3>
                    <p class="descricao_cards">grãos de café de altíssima qualidade diretamente na sua porta com dicas e receita</p>
                </div>
            </li>
            <li>
                <div>
                    <img class="fotos" src="fotos/gato-preto-caneca.png" alt="gatocaneca">
                    <h3 class="instrucoes">experimente</h3>
                    <p class="descricao_cards">a hora do café de uma maneira que você nunca pensou que poderia ter</p>
                </div>
            </li>
        </ul>

    </section>

    <section id="quem-somos" class="video">
        <h1 id="headline3">QUEM SOMOS?</h1>

        <video id="video" controls>
            <source src="fotos/VID-20231121-WA0020.mp4" type="video/mp4">
            Seu navegador não suporta o elemento de vídeo.
        </video>

    </section>
    
    <footer>
        <div class="footer">
            <p>Kopikat &copy; 2024. Todos os direitos reservados.</p>
        </div>
    </footer>

    <script src="script.js"></script>

</body>
</html>
