Config = {}

-- Sprech-Reichweiten (müssen mit pmavoice Proximity-Einstellungen übereinstimmen)
-- name: Anzeigename im UI
-- color: Hex-Farbe für die Anzeige
-- distance: Reichweite in Game-Units (muss mit pmavoice übereinstimmen)
Config.Ranges = {
    { name = "Flüstern", color = "#e74c3c", distance = 5.0  }, -- Rot    - Flüstern (kurze Reichweite)
    { name = "Normal",   color = "#f39c12", distance = 10.0 }, -- Orange - Normal (mittlere Reichweite)
    { name = "Schreien", color = "#2ecc71", distance = 15.0 }, -- Grün   - Schreien (große Reichweite)
}

-- Standard-Taste zum Wechseln der Reichweite
-- Kann im Spiel unter Einstellungen > Tastenbelegung > FiveM geändert werden
Config.DefaultKey = "LMENU"

-- Anzeigedauer nach dem Wechseln der Reichweite (in Millisekunden)
Config.DisplayDuration = 3000

-- Anzeige immer sichtbar (true) oder nur beim Wechseln (false)
Config.AlwaysShow = false

-- Ring-Anzeige: Zeichnet einen farbigen Kreis um den Spieler herum,
-- der die Sprech-Reichweite auf dem Boden anzeigt
Config.ShowRing = true

-- Deckkraft des Rings (0-255, höher = sichtbarer)
Config.RingOpacity = 180
