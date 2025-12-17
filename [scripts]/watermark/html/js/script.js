; (function () {
    const state = {
        playerId: 0,
        playerCount: 0
    };

    const horarioEl = document.getElementById('horario');
    const playersEl = document.getElementById('players');

    const renderPlayers = function () {
        playersEl.innerHTML = `<h3><span class="player_slot">${state.playerCount}</span> I BYEN</h3>`;
    };

    window.addEventListener('message', function (event) {
        const data = event.data;

        if (!data || data.action !== 'updateWatermark') {
            return;
        }

        let shouldRender = false;

        if (typeof data.count === 'number' && data.count !== state.playerCount) {
            state.playerCount = data.count;
            shouldRender = true;
        }

        if (shouldRender) {
            renderPlayers();
        }
    });

    moment.locale('da');

    const renderClock = function () {
        horarioEl.innerHTML = `<h3>${moment().format('HH:mm:ss @ DD/MM-YY')}</h3>`;
    };

    renderClock();
    renderPlayers();

    setInterval(renderClock, 1000);
})();

