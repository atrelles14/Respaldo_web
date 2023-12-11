<?php
    function processApiResponse($response) {
        $data = json_decode($response, true);
        foreach ($data['hits'] as $hit) {
            $result = $hit['result'];
            $id = $result['id'];
            $title_with_featured = $result['title_with_featured'];
            $header_image_url = $result['header_image_url'];
            $primary_artist_name = $result['primary_artist']['name'];
    
            echo '<div class="container">';
            echo '<img src="' . $header_image_url . '" alt="Banner ' . $title_with_featured . '">';
            echo '<div class="contenido">';
            echo '<div class="info">';
            echo '<h2>' . $title_with_featured . '</h3>';
            echo '<p><b>Artist:</b> ' . $primary_artist_name . '</p>';
    
            if (isset($result['featured_artists']) && is_array($result['featured_artists'])) {
                echo '<p><b>Featured Artists:</b> ';
                $featuredArtists = array_map(function ($artist) {
                    return $artist['name'];
                }, $result['featured_artists']);
                echo implode(', ', $featuredArtists) . '</p>';
            } else {
                echo "<p><b>Featured Artists:</b> null</p>";
            }
    
            echo '</div>';
            echo '<div class="bottons">';
            // En esta parte hay que corregir el boton de lyrics para que se vea bien
            echo '<form action="../API letras/call_api_letra.php" method="post">';
            echo '<input type="hidden" name="id" value="' . $id . '">';
            echo '<button type="submit">Lyrics</button>';
            echo '</form>';
            echo '</div>';
            echo '</div>';
            echo '</div>';
        }
    }
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../styles/style.css">
</head>
<body>
    <header>
        <div class="logo">
            <img src="../image/icon.png" alt="logo">
        </div>
        <nav>
            <ul>
                <li><a href="../Login.php">Login</a></li>
                <li><a href="../Registro.php">Sign Up</a></li>
            </ul>
        </nav>
    </header>
    <nav>
        <form action="call_api.php" method="post" onsubmit="transformAndSubmit()">
            <input type="text" name="nombre" id="nombre" value="<?php echo isset($_POST['nombre']) ? htmlspecialchars($_POST['nombre']) : ''; ?>">
            <input type="submit" value="Enviar">
        </form>
    </nav>
    <h1>Resultados:</h1>
    <section>
        <div class="display">
        <?php
            processApiResponse($response);
        ?>
        </div>
        <!-- de aqui para abajo se puede borrar like X -->
    </section>
    <a href="../index.php">Volver al index</a>
    <footer>
        <p>footer de toda la vida</p>
    </footer>
</body>
</html>
<!--  