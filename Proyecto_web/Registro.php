<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Usuario</title>
</head>
<body>
    <h2>Registro de Usuario</h2>
    <form action="procesar_registro.php" method="post">
        <label for="usuario">Nombre de Usuario:</label>
        <input type="text" id="usuario" name="usuario" value="<?php echo isset($_COOKIE['datos_ultimo_ingreso']) ? json_decode($_COOKIE['datos_ultimo_ingreso'])->usuario : ''; ?>" required><br><br>

        <label for="password">Contraseña:</label>
        <input type="password" id="password" name="password" value="<?php echo isset($_COOKIE['datos_ultimo_ingreso']) ? json_decode($_COOKIE['datos_ultimo_ingreso'])->password : ''; ?>" required><br><br>

        <label for="correo">Correo Electrónico:</label>
        <input type="text" id="correo" name="correo" value="<?php echo isset($_COOKIE['datos_ultimo_ingreso']) ? json_decode($_COOKIE['datos_ultimo_ingreso'])->correo : ''; ?>" required><br><br>

        <label for="usuario">Nombre:</label>
        <input type="text" id="usuario" name="nombre" value="<?php echo isset($_COOKIE['datos_ultimo_ingreso']) ? json_decode($_COOKIE['datos_ultimo_ingreso'])->nombre : ''; ?>" required><br><br>

        <label for="usuario">Apellido:</label>
        <input type="text" id="usuario" name="apellido" value="<?php echo isset($_COOKIE['datos_ultimo_ingreso']) ? json_decode($_COOKIE['datos_ultimo_ingreso'])->apellido : ''; ?>" required><br><br>

        <label for="usuario">Fecha de nacimiento:</label>
        <input type="date" id="fecha" name="fecha" value="<?php echo isset($_COOKIE['datos_ultimo_ingreso']) ? json_decode($_COOKIE['datos_ultimo_ingreso'])->fecha : ''; ?>" required>

        <input type="submit" value="Registrarse">
    </form>

    <p>¿Ya tienes una cuenta? <a href="index.php">Iniciar Sesión</a></p>
</body>
</html>
