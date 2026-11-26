
document.addEventListener("DOMContentLoaded", function() {

    const players = document.querySelectorAll(".audio-player");

    players.forEach((player, index) => {

        // Evita que se reproduzcan varios audios al mismo tiempo
        player.addEventListener("play", () => {
            players.forEach(p => {
                if (p !== player) {
                    p.pause();
                    p.currentTime = 0;
                }
            });
        });

        // Cuando termina un capítulo reproduce el siguiente
        player.addEventListener("ended", () => {
            const next = players[index + 1];

            if (next) {
                next.play();
                next.scrollIntoView({
                    behavior: "smooth",
                    block: "center"
                });
            }
        });


    });
    

});

