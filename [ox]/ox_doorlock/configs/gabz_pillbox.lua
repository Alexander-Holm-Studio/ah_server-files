return {
    -- Main Entrance Doors
    {
        model = 'gabz_pillbox_entrancedoor_l',
        coords = vector3(294.5, -1448.1, 29.9),
        locked = false,
        jobs = {'ambulance', 'doctor'},
        distance = 2.5,
        double = true,
        doubleDoor = 'gabz_pillbox_entrancedoor_r'
    },
    
    -- Emergency Room Door 1
    {
        model = 'gabz_pillbox_singledoor',
        coords = vector3(308.1, -1433.4, 29.9),
        locked = true,
        jobs = {'ambulance', 'doctor'},
        distance = 2.0
    },
    
    -- Emergency Room Door 2
    {
        model = 'gabz_pillbox_singledoor',
        coords = vector3(313.4, -1433.4, 29.9),
        locked = true,
        jobs = {'ambulance', 'doctor'},
        distance = 2.0
    },
    
    -- Operating Room 1
    {
        model = 'gabz_pillbox_doubledoor_r',
        coords = vector3(316.2, -1449.2, 29.9),
        locked = true,
        jobs = {'ambulance', 'doctor'},
        distance = 2.0,
        double = true,
        doubleDoor = 'gabz_pillbox_doubledoor_l'
    },
    
    -- Operating Room 2
    {
        model = 'gabz_pillbox_doubledoor_r',
        coords = vector3(324.2, -1449.2, 29.9),
        locked = true,
        jobs = {'ambulance', 'doctor'},
        distance = 2.0,
        double = true,
        doubleDoor = 'gabz_pillbox_doubledoor_l'
    },
    
    -- Staff Room
    {
        model = 'gabz_pillbox_singledoor',
        coords = vector3(309.1, -1442.5, 29.9),
        locked = true,
        jobs = {'ambulance', 'doctor'},
        distance = 2.0
    },
    
    -- Pharmacy
    {
        model = 'gabz_pillbox_singledoor',
        coords = vector3(302.5, -1440.2, 29.9),
        locked = true,
        jobs = {'ambulance', 'doctor'},
        distance = 2.0
    },
    
    -- Roof Access
    {
        model = 'gabz_pillbox_singledoor',
        coords = vector3(330.2, -1434.5, 46.5),
        locked = true,
        jobs = {'ambulance', 'doctor'},
        distance = 2.0
    }
}
