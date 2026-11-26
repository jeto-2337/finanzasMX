// timeAudio.js - Control de tiempo para usuarios no premium

const TIEMPO_MAX_SEGUNDOS = 180; // 3 minutos
let tiempoTotalSegundos = parseFloat(localStorage.getItem("tiempoAudio")) || 0;
let inicio = null;
let audioActual = null;
let bloqueado = false;

// Si es premium, no aplicar restricciones
if (window.esPremiumGlobal === true) {
    console.log("✅ Usuario premium - Sin límites de tiempo");
    // No hacer nada
} else {
    console.log("⏳ Modo demo - Límite de " + TIEMPO_MAX_SEGUNDOS + " segundos");
    
    // Esperar a que los audios estén cargados
    document.addEventListener("DOMContentLoaded", () => {
        const audios = document.querySelectorAll(".audio-player");
        
        audios.forEach(audio => {
            const esPremium = audio.dataset.premium === "1";
            
            if (esPremium) return;
            
            audio.addEventListener("play", () => {
                if (bloqueado) {
                    audio.pause();
                    mostrarOverlayPremium();
                    return;
                }
                
                // Pausar otros audios
                audios.forEach(a => {
                    if (a !== audio && !a.paused) {
                        a.pause();
                    }
                });
                
                audioActual = audio;
                inicio = Date.now();
            });
            
            audio.addEventListener("pause", () => {
                acumularTiempo();
            });
            
            audio.addEventListener("ended", () => {
                acumularTiempo();
            });
            
            audio.addEventListener("timeupdate", () => {
                if (bloqueado) return;
                
                // Verificar límite cada segundo
                if (tiempoTotalSegundos >= TIEMPO_MAX_SEGUNDOS) {
                    bloquearTodo();
                    audio.pause();
                }
            });
        });
        
        // Control continuo
        setInterval(() => {
            if (!inicio || bloqueado) return;
            
            let tiempoActual = tiempoTotalSegundos + (Date.now() - inicio) / 1000;
            
            if (tiempoActual >= TIEMPO_MAX_SEGUNDOS) {
                bloquearTodo();
                if (audioActual && !audioActual.paused) {
                    audioActual.pause();
                }
            }
        }, 500);
    });
}

function acumularTiempo() {
    if (inicio && !bloqueado) {
        tiempoTotalSegundos += (Date.now() - inicio) / 1000;
        inicio = null;
        guardarTiempo();
        
        if (tiempoTotalSegundos >= TIEMPO_MAX_SEGUNDOS) {
            bloquearTodo();
        }
    }
}

function guardarTiempo() {
    localStorage.setItem("tiempoAudio", tiempoTotalSegundos);
}

function bloquearTodo() {
    if (bloqueado) return;
    bloqueado = true;
    
    const audios = document.querySelectorAll(".audio-player");
    audios.forEach(audio => {
        audio.pause();
    });
    
    mostrarOverlayPremium();
}

function mostrarOverlayPremium() {
    if (document.getElementById("premiumOverlay")) return;
    
    const overlay = document.createElement("div");
    overlay.id = "premiumOverlay";
    overlay.innerHTML = `
        <div style="
            position:fixed;
            top:0;
            left:0;
            width:100%;
            height:100%;
            background:rgba(0,0,0,0.95);
            display:flex;
            justify-content:center;
            align-items:center;
            z-index:9999;
            backdrop-filter:blur(5px);
            animation:fadeIn 0.3s ease;
        ">
            <div style="
                background:#161b22;
                padding:40px;
                border-radius:12px;
                text-align:center;
                border:1px solid #8b5cf6;
                max-width:400px;
            ">
                <div style="font-size:48px;">🔒</div>
                <h2 style="color:#8b5cf6;">Límite de prueba alcanzado</h2>
                <p>Has usado tus 3 minutos gratuitos.<br>Obtén acceso completo:</p>
                <ul style="text-align:left; margin:20px;">
                    <li>✅ Audios ilimitados</li>
                    <li>✅ Todos los capítulos</li>
                    <li>✅ Acceso por 30 días</li>
                </ul>
                <a href="pago.php" style="
                    background:#8b5cf6;
                    padding:12px 30px;
                    color:white;
                    text-decoration:none;
                    border-radius:8px;
                    display:inline-block;
                    margin-top:10px;
                    font-weight:bold;
                ">🎧 Obtener Premium - $60 MXN</a>
                <button onclick="cerrarOverlay()" style="
                    background:transparent;
                    border:1px solid #30363d;
                    padding:10px 20px;
                    color:white;
                    border-radius:8px;
                    margin-top:15px;
                    cursor:pointer;
                ">Cerrar</button>
            </div>
        </div>
    `;
    
    document.body.appendChild(overlay);
}

function cerrarOverlay() {
    const overlay = document.getElementById("premiumOverlay");
    if (overlay) overlay.remove();
}

// Añadir animación si no existe
if (!document.querySelector('#fadeInStyle')) {
    const style = document.createElement('style');
    style.id = 'fadeInStyle';
    style.textContent = `
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    `;
    document.head.appendChild(style);
}