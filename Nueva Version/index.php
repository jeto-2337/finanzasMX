<link rel="manifest" href="/manifest.json">

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="./images/w.png">
    <title>FinanzasMX</title>
    <link rel="stylesheet" href="./styles/style.css">
    <link rel="stylesheet" href="./styles/alert.css">
    <script src="./js/banner.js"></script>
    <script src="https://accounts.google.com/gsi/client" async defer></script>

    <style>
        body { background-color: #ffffff; color: #000000; font-family: Arial, sans-serif; }
        .container { width: 350px; margin: 50px auto; text-align: center; }
        .icon { width: 500px; margin-bottom: 20px; }
        .g_id_signin { border-radius: 50px !important; box-shadow: 0 4px 8px rgba(255,255,255,0.2); }
        h1{
    color:#000;
}
    </style>
</head>

<body>
    <center>
        <div class="container">
            <img src="./images/icon.png" class="icon" alt="Logo">

            <form class="login-form" method="post">
                <h1>Iniciar sesión</h1>
                <br>
<div 
  id="g_id_onload"
  data-client_id="211528719932-fshkubneisgogen1uvnqmt448r75h4ge.apps.googleusercontent.com"
  data-context="signin"
  data-ux_mode="popup"
  data-callback="handleCredentialResponse"
  data-auto_prompt="false"
  data-itp_support="true">
</div>

<!-- Google Sign-In Button -->
<div 
  class="g_id_signin"
  data-type="standard"
  data-size="large"
  data-theme="outline"
  data-text="continue_with"
  data-shape="pill"
  data-logo_alignment="left"
  data-width="300">
</div>



                <br><br>
            </form>
        </div>
    </center>

    <script>
        function handleCredentialResponse(response) {
            fetch("google-login.php", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify({ token: response.credential })
            })
            .then(res => res.text())
            .then(res => {
                console.log("Respuesta de google-login.php:", res);
                if (res === "success") {
                    // Redirige a Welcome solo si el login es válido
                    window.location.href = "./Welcome/index.php";
                } else {
                    alert("Error al iniciar sesión con Google: " + res);
                }
            });
        }
    </script>

    <script>
        GoogleBanner();
    </script>
</body>
</html>