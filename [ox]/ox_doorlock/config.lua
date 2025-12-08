Config = {}

-- Distance to interact with doors
Config.InteractDistance = 2.0

-- Show door state text (locked/unlocked)
Config.ShowText = true

-- Use ox_target for door interaction
Config.UseTarget = true

-- Default door lock sound
Config.LockSound = 'button'
Config.UnlockSound = 'button'

-- Job permissions (can be overridden per door)
Config.DefaultJobs = {
    'police',
    'sheriff'
}

-- Door states
Config.DoorStates = {
    UNLOCKED = 0,
    LOCKED = 1,
    FORCE_LOCKED = 2  -- Cannot be unlocked without specific permission
}
