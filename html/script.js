window.addEventListener('message', function (event) {
    var data = event.data;

    switch (data.action) {
        case 'updateRange':
            updateRangeDisplay(data);
            break;
        case 'show':
            showIndicator();
            break;
        case 'hide':
            hideIndicator();
            break;
    }
});

function updateRangeDisplay(data) {
    var nameEl = document.getElementById('voice-range-name');
    var levelEl = document.getElementById('voice-range-level');
    var iconEl = document.getElementById('voice-icon');
    var indicator = document.getElementById('voice-range-indicator');

    nameEl.textContent = data.rangeName;
    nameEl.style.color = data.rangeColor;

    var percentage = (data.rangeLevel / data.maxLevel) * 100;
    levelEl.style.width = percentage + '%';
    levelEl.style.backgroundColor = data.rangeColor;
    levelEl.style.boxShadow = '0 0 10px ' + data.rangeColor;

    iconEl.style.color = data.rangeColor;

    indicator.style.borderColor = data.rangeColor + '40';
}

function showIndicator() {
    var container = document.getElementById('voice-range-container');
    container.classList.remove('hidden');
    container.classList.add('visible');
}

function hideIndicator() {
    var container = document.getElementById('voice-range-container');
    container.classList.remove('visible');
    container.classList.add('hidden');
}
