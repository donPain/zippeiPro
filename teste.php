<html>
    <head>
        <title>Macaco Mico Meu</title>
    </head>

    <body>
        <h1>Macaco Mico</h1>
        <?php 
            include("connection.php"); 

            $sql = "SELECT * FROM LOJA";
            $res = mysqli_query($con, $sql);
            $rows = mysqli_num_rows($res);
            echo "Encontrados $rows registros <br>";

            while($exibe = mysqli_fetch_array($res)){
                echo $exibe["ID"]." | ";
                echo $exibe["NOME_LOJA"]." | ";
                echo $exibe["FOTO_LOJA"]." | ";
                echo "<br>";
            }
            mysqli_close($con);
        ?>
    </body>
</html>