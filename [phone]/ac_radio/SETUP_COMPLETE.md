# AC Radio - pma-voice Integration Setup

## ✅ Configuration Complete

Your ac_radio is now properly configured to work with pma-voice. Here's what has been set up:

---

## What Was Configured

### 1. **Server.cfg Updates**
The following pma-voice convars have been added/updated:
```
setr voice_enableRadioAnim 1              # Enable radio animation
setr voice_useNativeAudio true            # Use native audio
setr voice_useSendingRangeOnly true       # Use sending range only
setr voice_enableRadios true              # Enable radio system (required for ac_radio)
setr voice_defaultRadio 0                 # Default radio channel (0 = none)
setr voice_enableSubmix true              # Enable submix for radio effect
setr voice_enableUi true                  # Enable voice UI
```

### 2. **Resource Loading Order**
✅ **Correct**: pma-voice loads BEFORE ac_radio (Phase 8 vs Phase 14)

### 3. **Dependencies**
✅ ac_radio fxmanifest.lua already declares:
- ox_lib
- pma-voice

### 4. **Radio Item**
✅ Radio item exists in ox_inventory (`data/items.lua`)
- Item name: `radio`
- Weight: 100
- Stackable: Yes
- Opens ac_radio when used

---

## How It Works

### Client-Side Integration
- ac_radio uses `exports['pma-voice']` for all radio functions
- Supports radio channels via `setRadioChannel()`
- Volume control via `setRadioVolume()`
- Radio state via `setVoiceProperty('radioEnabled', true/false)`

### Server-Side Integration
- ESX framework integration for usable item
- Automatic radio disconnect when item is removed (if configured)
- Job-based frequency restrictions (configurable in `config.lua`)

---

## Configuration Options

### In `config.lua`:
```lua
useUsableItem = true                    -- Use radio as inventory item
useCommand = false                      -- Disable /radio command
disconnectWithoutRadio = true           -- Disconnect if no radio in inventory
radioEffect = true                      -- Enable radio voice effect
radioAnimation = true                   -- Enable talking animation
radioTalkKey = 'Z'                      -- Push-to-talk key
maximumFrequencies = 1000               -- Max radio channels (0-1000)
```

### Restricted Channels (Police/Jobs):
```lua
restrictedChannels = {
    [10] = 'police',                    -- Channel 10 for police job
    [11] = {
        police = 2,                     -- Channel 11 for police grade 2+
    },
}
```

---

## How to Use In-Game

### For Players:
1. **Get a Radio**: Players need a `radio` item in their inventory
2. **Open Radio**: Use the radio item from inventory
3. **Join Frequency**: Enter a frequency (e.g., 100.00) and click connect
4. **Talk on Radio**: Press and hold `Z` key (default)
5. **Volume Control**: Use +/- buttons or mute button
6. **Save Presets**: Save favorite frequencies to buttons 1 & 2

### For Admins:
```
/radio:clear     - Clear saved radio presets
/doorlock [id] [lock/unlock] - Admin control (if authorized)
```

---

## Database Setup

If the radio item doesn't exist in your database, run the provided SQL:
```bash
File: install_radio_item.sql
```

This will:
- Add the radio item to your items table
- Optionally add it to shops
- Optionally give existing players a radio

---

## Testing Checklist

1. ✅ Restart your server
2. ✅ Give yourself a radio: `/giveitem [id] radio 1`
3. ✅ Use the radio from inventory
4. ✅ Connect to a frequency (e.g., 100.00)
5. ✅ Test with another player on the same frequency
6. ✅ Press Z to talk (should show animation)
7. ✅ Test volume controls (+/-/mute)
8. ✅ Test preset save/load

---

## Troubleshooting

### Radio doesn't open
- Check console for errors
- Verify ox_lib is loaded: `ensure ox_lib`
- Check if pma-voice is running: `ensure pma-voice`

### No voice on radio
- Verify pma-voice is working for normal voice first
- Check `voice_enableRadios` convar is set to `true`
- Ensure both players are on the SAME frequency

### Animation not working
- Check `voice_enableRadioAnim 1` in server.cfg
- Verify `radioAnimation = true` in config.lua

### Radio effect not working
- Check `voice_enableSubmix true` in server.cfg
- Verify `radioEffect = true` in config.lua

---

## Resource Start Order

```
1. ox_lib               (Phase 5)
2. pma-voice            (Phase 8)
3. ox_inventory         (Phase 6)
4. ac_radio             (Phase 14)
```

All dependencies load in correct order ✅

---

## Additional Notes

- **No rp-radio needed**: ac_radio is a complete replacement
- **Framework**: Works with ESX (already configured)
- **ox_inventory**: Radio item already configured
- **Performance**: Lightweight, optimized for large servers
- **Customization**: Edit `config.lua` for your server needs

---

## Support

- Documentation: https://docs.acscripts.dev/radio
- GitHub: https://github.com/acscripts/ac_radio
- Discord: https://discord.gg/2ZezMw2xvR

---

**Setup Date**: December 2, 2025
**Status**: ✅ Ready to use - Restart server to apply changes
