local currentRange = 1
local showUI = false
local hideTimer = 0

-- Tastenbelegung im GTA V Tastenbelegungssystem registrieren
-- Spieler können die Taste unter Einstellungen > Tastenbelegung > FiveM ändern
RegisterKeyMapping('voice_range_cycle', 'Sprech-Reichweite ändern', 'keyboard', Config.DefaultKey)

-- Befehl registrieren, der durch die Tastenbelegung ausgelöst wird
RegisterCommand('voice_range_cycle', function()
    CycleVoiceRange()
end, false)

-- Reichweite wechseln
function CycleVoiceRange()
    currentRange = currentRange + 1
    if currentRange > #Config.Ranges then
        currentRange = 1
    end

    -- Reichweite in pmavoice setzen
    exports['pma-voice']:setVoiceProperty('proximity', currentRange)

    -- UI aktualisieren und anzeigen
    UpdateRangeDisplay()
    ShowRangeIndicator()
end

-- UI mit aktuellen Daten aktualisieren
function UpdateRangeDisplay()
    local rangeData = Config.Ranges[currentRange]
    if rangeData then
        SendNUIMessage({
            action = "updateRange",
            rangeName = rangeData.name,
            rangeColor = rangeData.color,
            rangeLevel = currentRange,
            maxLevel = #Config.Ranges
        })
    end
end

-- Anzeige einblenden
function ShowRangeIndicator()
    showUI = true
    hideTimer = GetGameTimer() + Config.DisplayDuration

    SendNUIMessage({
        action = "show"
    })
end

-- Anzeige ausblenden
function HideRangeIndicator()
    showUI = false
    SendNUIMessage({
        action = "hide"
    })
end

-- Proximity-Änderungen von pmavoice per State-Bag-Handler erkennen
AddStateBagChangeHandler('proximity', ('player:%s'):format(GetPlayerServerId(PlayerId())), function(_bagName, _key, value)
    if value and value.index and value.index ~= currentRange then
        currentRange = value.index
        UpdateRangeDisplay()
        ShowRangeIndicator()
    end
end)

-- Auto-Hide Timer
CreateThread(function()
    while true do
        Wait(500)

        -- Automatisches Ausblenden nach Ablauf der Anzeigedauer
        if showUI and not Config.AlwaysShow and GetGameTimer() > hideTimer then
            HideRangeIndicator()
        end

        -- Permanente Anzeige wenn AlwaysShow aktiviert
        if Config.AlwaysShow and not showUI then
            showUI = true
            UpdateRangeDisplay()
            SendNUIMessage({ action = "show" })
        end
    end
end)

-- Initialisierung beim Ressourcenstart
CreateThread(function()
    -- Warten bis pmavoice initialisiert ist (mit Retry-Logik)
    local retries = 0
    local maxRetries = 20
    while retries < maxRetries do
        local proximity = LocalPlayer.state.proximity
        if proximity and proximity.index then
            currentRange = proximity.index
            break
        end
        retries = retries + 1
        Wait(500)
    end

    UpdateRangeDisplay()

    if Config.AlwaysShow then
        ShowRangeIndicator()
    end
end)
