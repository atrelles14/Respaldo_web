<?php
    $identificador = $_POST['id'];
    $curl = curl_init();

    curl_setopt_array($curl, [
        CURLOPT_URL => "https://genius-song-lyrics1.p.rapidapi.com/song/lyrics/?id=".$identificador."&text_format=html",
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_ENCODING => "",
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 30,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => "GET",
        CURLOPT_HTTPHEADER => [
            "X-RapidAPI-Host: genius-song-lyrics1.p.rapidapi.com",
            "X-RapidAPI-Key: 50641223fcmshee265182bc1fce7p1e069djsn86b8f233a1e9"
        ],
    ]);

    $response_letra = curl_exec($curl);
    $err = curl_error($curl);

    curl_close($curl);

    if ($err) {
        echo "cURL Error #:" . $err;
    } else {
		// Incluye el archivo con la función
		include('../VIEW_USERS/Display_letra_users.php');
		
		// Llama a la función para procesar la respuesta
		processApiResponseLetra($response_letra);
    }
?>