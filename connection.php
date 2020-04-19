<?php

    $host = "mysql16-farm76.kinghost.net";
    $user = "eduardonzeli";
    $senha = "xurupita123";
    $banco = "eduardonzeli";

    

    $con = mysqli_connect($host, $user, $senha);   
    mysqli_select_db($con, $banco);
?>