# ox_doorlock - Door Lock System

## Features
- ✅ ox_target integration for easy door interaction
- ✅ Job-based permissions
- ✅ Support for single and double doors
- ✅ Pre-configured for gabz_mrpd and gabz_pillbox
- ✅ Sound effects and notifications
- ✅ Easy to add new doors

## Installation

1. Ensure dependencies are started in server.cfg:
```
ensure ox_lib
ensure ox_target
ensure es_extended
ensure ox_doorlock
```

2. Restart your server

## Usage

### In-Game
- Look at a door
- Use ox_target (default: Left Alt)
- Click "Toggle Door Lock"
- Door will lock/unlock with sound and notification

### Adding New Doors

Create a new file in `configs/` folder:

```lua
-- configs/my_building.lua
return {
    {
        model = 'prop_door_model',  -- Door model hash or name
        coords = vector3(x, y, z),  -- Door coordinates
        locked = true,              -- Initial state
        jobs = {'police'},          -- Jobs that can use this door
        distance = 2.0,             -- Interaction distance
        double = false,             -- Is it a double door?
        doubleDoor = nil,           -- Second door model (if double)
        heading = 0.0               -- Door heading (optional)
    }
}
```

Then add the config file name to both `client.lua` and `server.lua`:
```lua
local configFiles = {
    'gabz_mrpd',
    'gabz_pillbox',
    'my_building',  -- Add your new config here
}
```

## Configuration

Edit `config.lua` to customize:

```lua
Config.InteractDistance = 2.0  -- Default interaction distance
Config.ShowText = true          -- Show lock/unlock notifications
Config.UseTarget = true         -- Use ox_target (recommended)
Config.DefaultJobs = {          -- Default jobs with access
    'police',
    'sheriff'
}
```

## Pre-Configured Locations

### MRPD (gabz_mrpd)
- Main entrance
- Front desk doors
- Cell doors (3 cells)
- Interrogation rooms (2 rooms)
- Evidence room
- Armory
- Captain's office
- Locker rooms
- Roof access
- Garage doors
- And more...

### Pillbox Hospital (gabz_pillbox)
- Main entrance
- Emergency room doors
- Operating rooms
- Staff room
- Pharmacy
- Roof access

## Admin Commands

```
/doorlock [doorId] [lock/unlock]
```

Example: `/doorlock 1 lock`

## Troubleshooting

### Doors not working
1. Check that ox_lib and ox_target are started
2. Verify door coordinates are correct
3. Make sure you have the correct job
4. Check console for errors

### Finding Door Coordinates
1. Stand in front of the door
2. Use `/getcoords` or similar command
3. Add the coordinates to your config file

### Finding Door Models
1. Use a resource like `object_gizmo` or similar
2. Look at the door and note the model name
3. Add to your config file

## Support

For issues or questions:
1. Check door coordinates are accurate
2. Verify job names match your ESX jobs
3. Check console for error messages
4. Ensure all dependencies are running

## Credits

Created for ESX Legacy with ox_lib and ox_target integration.
