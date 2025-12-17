# ESX Watermark Script

## Features
- Displays current date and time
- Shows online player count
- Shows your **database ID** (not server slot ID)
- Fully integrated with ESX Legacy
- Updates dynamically every 5 seconds

## Installation
1. Ensure you have `es_extended` and `oxmysql` installed and running
2. Add `ensure watermark` to your server.cfg (make sure it starts AFTER es_extended)

```cfg
ensure es_extended
ensure oxmysql
ensure watermark
```

## What It Shows
- **Top Line**: Date and time (DD/MM/YYYY HH:mm:ss)
- **Bottom Line**: Player count and your database ID (e.g., "32 Online - ID: 1245")

## Customization

### Change Server Name
Edit `html/index.html` line 12:
```html
<h1>Your<span>Server</span></h1>
```
Change "Your" and "Server" to your server name.

### Change Colors
Edit `html/css/style.css` to modify colors, fonts, sizes, etc.

### Change Update Frequency
Edit `jns_client.lua` line 35:
```lua
Wait(5000) -- Update every 5 seconds
```
Change 5000 to desired milliseconds.

## Commands
- `/myid` - Check your database ID in chat

## Troubleshooting
1. Make sure ESX Legacy is running
2. Verify oxmysql is properly configured
3. Check F8 console for any errors
4. Ensure the resource starts after es_extended in server.cfg

## Database Query
The script queries your ESX database `users` table to get the real database ID, not the temporary server slot.
