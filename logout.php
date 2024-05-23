//Desloga o usuário
<?php
session_start();
session_unset();
session_destroy();
header("Location: home-page.html");
exit();
?>