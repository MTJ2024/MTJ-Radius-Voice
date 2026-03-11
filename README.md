# MTJ-Radius-Voice

Farbige Sprech-Reichweitenanzeige für **FiveM** mit **pmavoice** Integration.

## Features

- 🎨 **Farbige Reichweitenanzeige** – Zeigt die aktuelle Sprech-Reichweite mit farbigem Indikator an
  - 🔴 **Flüstern** (Rot) – Kurze Reichweite
  - 🟠 **Normal** (Orange) – Mittlere Reichweite
  - 🟢 **Schreien** (Grün) – Große Reichweite
- ⌨️ **GTA V Tastenbelegung** – Taste zum Wechseln der Reichweite über das GTA V Tastenbelegungssystem einstellbar
- 🔗 **pmavoice Integration** – Arbeitet direkt mit pmavoice zusammen
- ⏱️ **Auto-Hide** – Anzeige verschwindet automatisch nach einstellbarer Zeit
- ⚙️ **Konfigurierbar** – Farben, Reichweiten-Namen, Taste und Anzeigedauer anpassbar

## Voraussetzungen

- [FiveM](https://fivem.net/) Server
- [pma-voice](https://github.com/AvarianKnight/pma-voice) installiert und konfiguriert

## Installation

1. Lade das Repository herunter oder klone es:
   ```
   git clone https://github.com/MTJ2024/MTJ-Radius-Voice.git
   ```
2. Kopiere den Ordner `MTJ-Radius-Voice` in deinen FiveM Server `resources` Ordner
3. Füge `ensure MTJ-Radius-Voice` in deine `server.cfg` ein (nach `ensure pma-voice`)
4. Starte den Server neu

## Konfiguration

Bearbeite die Datei `config.lua` um die Einstellungen anzupassen:

```lua
Config.Ranges = {
    { name = "Flüstern",  color = "#e74c3c" },   -- Rot
    { name = "Normal",    color = "#f39c12" },     -- Orange
    { name = "Schreien",  color = "#2ecc71" },     -- Grün
}

Config.DefaultKey = "F3"           -- Standard-Taste (im Spiel änderbar)
Config.DisplayDuration = 3000      -- Anzeigedauer in Millisekunden
Config.AlwaysShow = false          -- Immer sichtbar oder nur beim Wechseln
```

## Tastenbelegung

- Standard-Taste: **F3** (zum Wechseln der Sprech-Reichweite)
- Die Taste kann im Spiel unter **Einstellungen → Tastenbelegung → FiveM** geändert werden

## Lizenz

MIT
