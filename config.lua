Config = {}

-- Sprech-Reichweiten (müssen mit pmavoice Proximity-Einstellungen übereinstimmen)
-- name: Anzeigename im UI
-- color: Hex-Farbe für die Anzeige
Config.Ranges = {
    { name = "Flüstern", color = "#e74c3c" }, -- Rot    - Flüstern (kurze Reichweite)
    { name = "Normal",   color = "#f39c12" }, -- Orange - Normal (mittlere Reichweite)
    { name = "Schreien", color = "#2ecc71" }, -- Grün   - Schreien (große Reichweite)
}

-- Standard-Taste zum Wechseln der Reichweite
-- Kann im Spiel unter Einstellungen > Tastenbelegung > FiveM geändert werden
Config.DefaultKey = "F3"

-- Anzeigedauer nach dem Wechseln der Reichweite (in Millisekunden)
Config.DisplayDuration = 3000

-- Anzeige immer sichtbar (true) oder nur beim Wechseln (false)
Config.AlwaysShow = false
