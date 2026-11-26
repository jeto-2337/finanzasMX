<?php
session_start();

// 1. Heurística: Prevención de errores (Validación de sesión)
if (!isset($_SESSION["user_id"]) || !isset($_SESSION["email"]) || !isset($_SESSION["name"])) {
    session_destroy();
    header('Location: ../');
    exit();
}

$user_id = $_SESSION['user_id'];
$user = $_SESSION["email"];
$name = $_SESSION["name"];

include_once '../database/database.php';

// Conexión única (Eficiencia de recursos)
$connection = mysqli_connect(host, user, password, database, port);

if (!$connection) {
    die("Error de conexión: " . mysqli_connect_error());
}

// 🔥 VERIFICAR SI ES PREMIUM Y NO HA EXPIRADO
$queryPremium = "
    SELECT fecha_inicio, fecha_expiracion, fecha_pago 
    FROM pagos 
    WHERE user_id = ? 
    AND estado = 'pagado'
    AND fecha_expiracion >= CURDATE()
    ORDER BY id DESC 
    LIMIT 1
";

$stmt = mysqli_prepare($connection, $queryPremium);
mysqli_stmt_bind_param($stmt, "s", $user);
mysqli_stmt_execute($stmt);
$resultPremium = mysqli_stmt_get_result($stmt);

$esPremium = (mysqli_num_rows($resultPremium) > 0);
$fechaExpiracion = null;
$diasRestantes = 0;

if ($esPremium) {
    $pagoData = mysqli_fetch_assoc($resultPremium);
    $fechaExpiracion = $pagoData['fecha_expiracion'];
    $diasRestantes = (strtotime($fechaExpiracion) - time()) / 86400;
    $diasRestantes = round($diasRestantes);
}







/** USUARIOS **/
// Buscamos si ya existe un usuario con ese email
$queryCheck = "SELECT * FROM `USERS` WHERE `EMAIL` = ? LIMIT 1";
$stmt = mysqli_prepare($connection, $queryCheck);
mysqli_stmt_bind_param($stmt, "s", $user);
mysqli_stmt_execute($stmt);
$resultCheck = mysqli_stmt_get_result($stmt);

// Si no hay resultados, procedemos a insertar
if (mysqli_num_rows($resultCheck) == 0) {
    $queryInsert = "INSERT INTO `USERS` (`USER`, `EMAIL`) VALUES (?, ?)";
    $stmt = mysqli_prepare($connection, $queryInsert);
    mysqli_stmt_bind_param($stmt, "ss", $name, $user);
    $iu = mysqli_stmt_execute($stmt);

    if (!$iu) {
        // Error silencioso para no romper la UI
        error_log("Error al registrar usuario: " . mysqli_error($connection));
    }
}











// Obtener nombre del proyecto
$query0 = "SELECT NAME FROM `NAME_PROJECT` LIMIT 1";
$result0 = mysqli_query($connection, $query0);
$projectData = mysqli_fetch_assoc($result0);
$projectName = $projectData["NAME"] ?? "Biblioteca Digital";
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo htmlspecialchars($projectName); ?></title>
    <link rel="icon" href="../images/icon.png">
    <style>
        :root {
            --bg-main: #ffffff;
            --bg-card: #ffffff;
            --accent: #8b5cf6;
            --text-primary: #000000;
            --text-secondary: #8b949e;
            --border: #30363d;
            --warning: #f97316;
            --success: #2ea043;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
        }

        body {
            background-color: var(--bg-main);
            color: var(--text-primary);
            line-height: 1.6;
        }

        /* --- Barra de Navegación --- */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1rem 5%;
            background-color: var(--bg-card);
            border-bottom: 1px solid var(--border);
            position: sticky;
            top: 0;
            z-index: 100;
            flex-wrap: wrap;
            gap: 10px;
        }

        .brand {
            font-size: 1.25rem;
            font-weight: bold;
            color: var(--accent);
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .user-controls {
            display: flex;
            align-items: center;
            gap: 20px;
            flex-wrap: wrap;
        }

        .welcome-msg {
            color: var(--text-secondary);
            font-size: 0.9rem;
        }

        .premium-badge {
            background: linear-gradient(135deg, var(--accent), #6d28d9);
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: bold;
        }

        .btn-premium {
            background: linear-gradient(135deg, #ffb731, #ffa000);
            font-weight: bold;
            color: #000;
            text-decoration: none;
            padding: 6px 15px;
            border-radius: 6px;
            font-size: 0.85rem;
            transition: all 0.2s;
        }

        .btn-premium:hover {
            transform: translateY(-1px);
            box-shadow: 0 2px 8px rgba(255, 183, 49, 0.3);
        }

        .btn-logout {
            color: var(--text-primary);
            text-decoration: none;
            padding: 6px 15px;
            border: 1px solid var(--border);
            border-radius: 6px;
            font-size: 0.85rem;
            transition: all 0.2s;
        }

        .btn-logout:hover {
            background: #21262d;
            border-color: #8b949e;
        }

        /* --- Banner de expiración --- */
        .expiration-banner {
            background: rgba(139, 92, 246, 0.1);
            border: 1px solid var(--accent);
            border-radius: 8px;
            padding: 12px 20px;
            margin-bottom: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 10px;
        }

        .warning-banner {
            background: rgba(249, 115, 22, 0.15);
            border-color: var(--warning);
        }

        .renew-link {
            color: var(--accent);
            text-decoration: none;
            font-weight: bold;
        }

        /* --- Contenedor de Contenido --- */
        .container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 20px;
        }

        .section-header {
            margin-bottom: 2rem;
            border-left: 5px solid var(--accent);
            padding-left: 15px;
        }

        .section-header h1 {
            font-size: 1.8rem;
            font-weight: 600;
        }

        /* --- Grid de Libros --- */
        .book-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 25px;
        }

        .book-card {
            background: var(--bg-card);
            border-radius: 12px;
            border: 1px solid var(--border);
            text-decoration: none;
            transition: transform 0.3s cubic-bezier(0.4, 0, 0.2, 1), border-color 0.3s;
            overflow: hidden;
            display: flex;
            flex-direction: column;
            cursor: pointer;
        }

        .book-card:hover {
            transform: translateY(-8px);
            border-color: var(--accent);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.4);
        }

        .book-image {
            width: 100%;
            aspect-ratio: 2/3;
            object-fit: cover;
            background: #000;
        }

        .book-details {
            padding: 15px;
            text-align: center;
        }

        .book-title {
            color: var(--text-primary);
            font-size: 1rem;
            font-weight: 500;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

        .premium-lock {
            position: relative;
        }

        /* Responsive */
        @media (max-width: 600px) {
            .book-grid {
                grid-template-columns: repeat(2, 1fr);
                gap: 15px;
            }

            .welcome-msg {
                display: none;
            }

            .expiration-banner {
                flex-direction: column;
                text-align: center;
            }
        }
    </style>
</head>

<body>

    <nav class="navbar">
        <div class="brand">
             <?php echo htmlspecialchars($projectName); ?>
        </div>

        <div class="user-controls">
            <span class="welcome-msg">
                👋 Hola, <strong><?php echo htmlspecialchars($name); ?></strong>
            </span>

            <?php if ($esPremium): ?>
                <span class="premium-badge">✨ Premium ✨</span>
            <?php endif; ?>

            <a href="pago.php" class="btn-premium">💎 Premium</a>
            <a href="Close.php" class="btn-logout">🚪 Cerrar Sesión</a>
        </div>
    </nav>

    <?php if ($esPremium): ?>
        <div class="container" style="margin-top: 0; margin-bottom: 0;">
            <div class="expiration-banner <?php echo ($diasRestantes <= 7) ? 'warning-banner' : ''; ?>">
                <span>🎧 Acceso premium activo hasta: <strong><?php echo date('d/m/Y', strtotime($fechaExpiracion)); ?></strong></span>
                <?php if ($diasRestantes <= 7): ?>
                    <span style="color: var(--warning);">⚠️ Expira en <?php echo $diasRestantes; ?> días</span>
                    <a href="pago.php?renovar=1" class="renew-link">Renovar suscripción →</a>
                <?php endif; ?>
            </div>
        </div>
    <?php else: ?>
        <div class="container" style="margin-top: 0; margin-bottom: 0;">
            <div class="expiration-banner warning-banner">
                <span>⏳ Prueba nuestro sistema </span>
                <a href="pago.php" class="renew-link">🔥 Hazte premium por $100 MXN (30 días) →</a>
            </div>
        </div>
    <?php endif; ?>

    <main class="container">
        <header class="section-header">
            <h1>My Wallet</h1>
        </header>

        <section class="book-grid">







<a href="">Ingresos 💸</a>
<a href="">Gastos 🛒</a>
<a href="">Inversiones 🚀</a>


<div onclick="isbnFree(\'' . htmlspecialchars($book['ISBN']) . '\')" class="book-card">
                            <img src="' . htmlspecialchars($cover) . '" alt="' . htmlspecialchars($book["TITLE"]) . '" class="book-image" loading="lazy">
                            <div class="book-details">
                                <span class="book-title">📖 ' . htmlspecialchars($book["TITLE"]) . '</span>
                                <span style="font-size: 0.7rem; color: #2ea043;">(Gratuito)</span>
                            </div>
                        </div>









        </section>
    </main>
</body>

</html>

<?php
// Cerrar conexión al final
mysqli_close($connection);
?>