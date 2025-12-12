Config                           = {}

Config.DrawDistance              = 10.0 -- How close do you need to be in order for the markers to be drawn (in GTA units).
Config.Debug                     = ESX.GetConfig().EnableDebug
Config.Marker                    = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }

Config.ReviveReward              = 700  -- Revive reward, set to 0 if you don't want it enabled
Config.LoadIpl                   = true -- Disable if you're using fivem-ipl or other IPL loaders

Config.Locale                    = GetConvar('esx:locale', 'da')

-- Prevents desync on dead players by skipping ragdoll.
-- Players are revived instantly and play an animation instead.
-- Note: Natives like "IsPedFatallyInjured" will no longer work reliably.
-- Use Player(src).state.isDead for death checks.
Config.DeathAnim                 = {
	enabled = true,
	dict = "misslamar1dead_body",
	name = "dead_idle",
	fadeIn = 10.0,
	fadeOut = 10.0,
	flags = 1|2|8,
	playbackRate = 1.0
}

Config.DistressBlip              = {
	Sprite = 310,
	Color = 48,
	Scale = 2.0
}

Config.zoom                      = {
	min = 1,
	max = 6,
	step = 0.5
}

Config.EarlyRespawnTimer         = 60000 * 1  -- time til respawn is available
Config.BleedoutTimer             = 60000 * 10 -- time til the player bleeds out

Config.EnablePlayerManagement    = false      -- Enable society managing (If you are using esx_society).

Config.RemoveWeaponsAfterRPDeath = true
Config.RemoveCashAfterRPDeath    = true
Config.RemoveItemsAfterRPDeath   = true

-- Let the player pay for respawning early, only if he can afford it.
Config.EarlyRespawnFine          = false
Config.EarlyRespawnFineAmount    = 5000

Config.OxInventory               = ESX.GetConfig().OxInventory
Config.RespawnPoints             = {
	{ coords = vector3(341.0, -1397.3, 32.5),    heading = 48.5 }, -- Central Los Santos
	{ coords = vector3(1836.03, 3670.99, 34.28), heading = 296.06 } -- Sandy Shores
}

Config.PharmacyItems             = {
	{
		title = "Medikit",
		item = "medikit"
	},
	{
		title = "Bandage",
		item = "bandage"
	},
}

Config.Hospitals                 = {

	Pillbox = {

		Blip = {
			coords = vector3(336.8170, -580.3730, 28.7969),
			sprite = 61,
			scale  = 1.2,
			color  = 2
		},

		AmbulanceActions = {
			vector3(336.8170, -580.3730, 28.7969)
		},

		Pharmacies = {
			vector3(336.8170, -580.3730, 28.7969)
		},

		Vehicles = {
			{
				Spawner = vector3(336.8170, -580.3730, 28.3),
				InsideShop = vector4(336.8170, -580.3730, 28.3, 332.3907),
				Marker = { type = 36, x = 2.0, y = 2.0, z = 1.0, r = 100, g = 50, b = 200, a = 100, rotate = false },
				SpawnPoints = {
					{ coords = vector3(336.8170, -580.3730, 28.3), heading = 332.3907, radius = 4.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(351.09555053711, -587.77087402344, 43.315032958984),
				InsideShop = vector4(351.09555053711, -587.77087402344, 43.315032958984, 0.0),
				Marker = { type = 34, x = 1.5, y = 1.5, z = 1.5, r = 100, g = 150, b = 150, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(351.09555053711, -587.77087402344, 43.315032958984), heading = 0.0, radius = 10.0 }
				}
			}
		},

		FastTravels = {},

		FastTravelsPrompt = {}

	}
}

Config.AuthorizedVehicles        = {
	car = {
		ambulance = {
			{ model = 'ambulance', price = 5000 }
		},

		doctor = {
			{ model = 'ambulance', price = 4500 }
		},

		chief_doctor = {
			{ model = 'ambulance', price = 3000 }
		},

		boss = {
			{ model = 'ambulance', price = 2000 }
		}
	},

	helicopter = {
		ambulance = {},

		doctor = {
			{ model = 'buzzard2', price = 150000 }
		},

		chief_doctor = {
			{ model = 'buzzard2',   price = 150000 },
			{ model = 'seasparrow', price = 300000 }
		},

		boss = {
			{ model = 'buzzard2',   price = 10000 },
			{ model = 'seasparrow', price = 250000 }
		}
	}
}
