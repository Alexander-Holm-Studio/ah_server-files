Config                        = {}

Config.DrawDistance           = 10.0 -- How close do you need to be for the markers to be drawn (in GTA units).
Config.MarkerType             = { Cloakrooms = 20, Armories = 21, BossActions = 22, Vehicles = 36, Helicopters = 34 }
Config.MarkerSize             = { x = 1.5, y = 1.5, z = 0.5 }
Config.MarkerColor            = { r = 50, g = 50, b = 204 }

Config.EnablePlayerManagement = true       -- Enable if you want society managing.
Config.EnableArmoryManagement = false
Config.EnableESXIdentity      = true       -- Enable if you're using esx_identity.
Config.EnableESXOptionalneeds = false      -- Enable if you're using esx_optionalneeds
Config.EnableLicenses         = false      -- Enable if you're using esx_license.

Config.EnableHandcuffTimer    = true       -- Enable handcuff timer? will unrestrain player after the time ends.
Config.HandcuffTimer          = 10 * 60000 -- 10 minutes.

Config.EnableCustomPeds       = false      -- Enable custom peds in cloak room? See Config.CustomPeds below to customize peds.

Config.EnableESXService       = false      -- Enable esx service?
Config.MaxInService           = -1         -- How many people can be in service at once? Set as -1 to have no limit

Config.EnableFinePresets      = false      -- Set to false to use a custom input fields for fines

Config.Locale                 = GetConvar('esx:locale', 'da')

Config.OxInventory            = ESX.GetConfig().OxInventory

Config.PoliceStations         = {

	LSPD = {

		Blip = {
			Coords  = vector3(428.9, -984.5, 30.7), -- GABZ MRPD Main Entrance
			Sprite  = 60,
			Display = 4,
			Scale   = 1.2,
			Colour  = 29
		},

		Cloakrooms = {
			vector3(452.6, -992.8, 30.6)
		},
		Armories = {
			vector3(479.7, -996.6, 30.7), -- GABZ MRPD Armory
			vector3(453.1, -980.2, 30.7) -- GABZ MRPD Secondary Armory
		},

		Vehicles = {
			{
				Spawner = vector3(459.3575, -986.5589, 25.6998), -- Main garage spawner
				InsideShop = vector3(228.5, -993.5, -99.5),
				SpawnPoints = {
					{ coords = vector3(450.07, -975.77, 25.37), heading = 90.07,  radius = 6.0 },
					{ coords = vector3(435.0, -975.85, 25.37),  heading = 90.34,  radius = 6.0 },
					{ coords = vector3(445.97, -986.17, 25.36), heading = 271.1,  radius = 6.0 },
					{ coords = vector3(445.71, -988.8, 25.36),  heading = 270.33, radius = 6.0 }
				}
			},

			{
				Spawner = vector3(473.3, -1018.8, 28.0), -- Side garage spawner
				InsideShop = vector3(228.5, -993.5, -99.0),
				SpawnPoints = {
					{ coords = vector3(475.9, -1021.6, 28.0), heading = 276.1, radius = 6.0 },
					{ coords = vector3(484.1, -1023.1, 27.5), heading = 302.5, radius = 6.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(461.1, -981.5, 43.6), -- GABZ MRPD Helipad
				InsideShop = vector3(477.0, -1106.4, 43.0),
				SpawnPoints = {
					{ coords = vector3(449.5, -981.2, 43.6), heading = 92.6, radius = 10.0 }
				}
			}
		},

		BossActions = {
			vector3(459.8, -985.3, 30.7) -- GABZ MRPD Chief's Office
		}

	}

}
Config.AuthorizedWeapons      = {
	recruit = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = {}, price = 5000 },
		{ weapon = 'WEAPON_NIGHTSTICK',   price = 0 },
		{ weapon = 'WEAPON_STUNGUN',      price = 500 },
		{ weapon = 'WEAPON_FLASHLIGHT',   price = 0 }
	},

	officer = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = {}, price = 5000 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = {}, price = 35000 },
		{ weapon = 'WEAPON_NIGHTSTICK',   price = 0 },
		{ weapon = 'WEAPON_STUNGUN',      price = 500 },
		{ weapon = 'WEAPON_FLASHLIGHT',   price = 0 }
	},

	sergeant = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = {}, price = 5000 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = {}, price = 35000 },
		{ weapon = 'WEAPON_NIGHTSTICK',   price = 0 },
		{ weapon = 'WEAPON_STUNGUN',      price = 500 },
		{ weapon = 'WEAPON_FLASHLIGHT',   price = 0 }
	},

	lieutenant = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = {}, price = 5000 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = {}, price = 35000 },
		{ weapon = 'WEAPON_NIGHTSTICK',   price = 0 },
		{ weapon = 'WEAPON_STUNGUN',      price = 500 },
		{ weapon = 'WEAPON_FLASHLIGHT',   price = 0 }
	},

	boss = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = {}, price = 5000 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = {}, price = 35000 },
		{ weapon = 'WEAPON_NIGHTSTICK',   price = 0 },
		{ weapon = 'WEAPON_STUNGUN',      price = 500 },
		{ weapon = 'WEAPON_FLASHLIGHT',   price = 0 }
	}
}


Config.AuthorizedVehicles = {
	car = {
		recruit = {
			{ model = 'fbi',     price = 20000 },
			{ model = 'fbi2',    price = 20000 },
			{ model = 'police',  price = 20000 },
			{ model = 'police2', price = 20000 },
			{ model = 'police3', price = 20000 },
			{ model = 'police4', price = 20000 },
			{ model = 'police5', price = 20000 }
		},
		officer = {
			{ model = 'fbi',     price = 20000 },
			{ model = 'fbi2',    price = 20000 },
			{ model = 'police',  price = 20000 },
			{ model = 'police2', price = 20000 },
			{ model = 'police3', price = 20000 },
			{ model = 'police4', price = 20000 },
			{ model = 'police5', price = 20000 }
		},
		sergeant = {
			{ model = 'fbi',     price = 20000 },
			{ model = 'fbi2',    price = 20000 },
			{ model = 'police',  price = 20000 },
			{ model = 'police2', price = 20000 },
			{ model = 'police3', price = 20000 },
			{ model = 'police4', price = 20000 },
			{ model = 'police5', price = 20000 }
		},
		lieutenant = {
			{ model = 'fbi',     price = 20000 },
			{ model = 'fbi2',    price = 20000 },
			{ model = 'police',  price = 20000 },
			{ model = 'police2', price = 20000 },
			{ model = 'police3', price = 20000 },
			{ model = 'police4', price = 20000 },
			{ model = 'police5', price = 20000 }
		},
		boss = {
			{ model = 'fbi',     price = 20000 },
			{ model = 'fbi2',    price = 20000 },
			{ model = 'police',  price = 20000 },
			{ model = 'police2', price = 20000 },
			{ model = 'police3', price = 20000 },
			{ model = 'police4', price = 20000 },
			{ model = 'police5', price = 20000 }
		}
	},
	helicopter = {
		recruit = {
			{ model = 'polmav', props = { modLivery = 0 }, price = 100000 }
		},
		officer = {
			{ model = 'polmav', props = { modLivery = 0 }, price = 100000 }
		},
		sergeant = {
			{ model = 'polmav', props = { modLivery = 0 }, price = 100000 }
		},
		lieutenant = {
			{ model = 'polmav', props = { modLivery = 0 }, price = 100000 }
		},
		boss = {
			{ model = 'polmav', props = { modLivery = 0 }, price = 100000 }
		}
	}
}

Config.CustomPeds = {
	shared = {
		{ label = TranslateCap('s_m_y_sheriff_01'), maleModel = 's_m_y_sheriff_01', femaleModel = 's_f_y_sheriff_01' },
		{ label = TranslateCap('s_m_y_cop_01'),     maleModel = 's_m_y_cop_01',     femaleModel = 's_f_y_cop_01' }
	},

	recruit = {},

	officer = {},

	sergeant = {},

	lieutenant = {},

	boss = {
		{ label = TranslateCap('s_m_y_swat_01'), maleModel = 's_m_y_swat_01', femaleModel = 's_m_y_swat_01' }
	}
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements
-- Danish Police EUP Uniforms (requires eup-stream resource)
Config.Uniforms = {
	recruit = {
		male = {
			tshirt_1 = 15,
			tshirt_2 = 0, -- Undershirt
			torso_1 = 287,
			torso_2 = 0, -- Danish Police Jacket (EUP)
			decals_1 = 0,
			decals_2 = 0,
			arms = 1,
			pants_1 = 130,
			pants_2 = 0, -- Danish Police Pants (EUP)
			shoes_1 = 25,
			shoes_2 = 0, -- Black boots
			helmet_1 = 117,
			helmet_2 = 0, -- Danish Police Cap (EUP)
			chain_1 = 0,
			chain_2 = 0,
			ears_1 = -1,
			ears_2 = 0,
			bproof_1 = 0,
			bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,
			tshirt_2 = 0, -- Undershirt
			torso_1 = 300,
			torso_2 = 0, -- Danish Police Jacket (EUP Female)
			decals_1 = 0,
			decals_2 = 0,
			arms = 14,
			pants_1 = 133,
			pants_2 = 0, -- Danish Police Pants (EUP Female)
			shoes_1 = 27,
			shoes_2 = 0, -- Black boots
			helmet_1 = 117,
			helmet_2 = 0, -- Danish Police Cap (EUP)
			chain_1 = 0,
			chain_2 = 0,
			ears_1 = -1,
			ears_2 = 0,
			bproof_1 = 0,
			bproof_2 = 0
		}
	},

	officer = {
		male = {
			tshirt_1 = 15,
			tshirt_2 = 0, -- Undershirt
			torso_1 = 288,
			torso_2 = 1, -- Danish Police Shirt (EUP)
			decals_1 = 0,
			decals_2 = 0,
			arms = 11,
			pants_1 = 130,
			pants_2 = 0, -- Danish Police Pants (EUP)
			shoes_1 = 25,
			shoes_2 = 0, -- Black boots
			helmet_1 = -1,
			helmet_2 = 0, -- No hat
			chain_1 = 0,
			chain_2 = 0,
			ears_1 = -1,
			ears_2 = 0,
			bproof_1 = 0,
			bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,
			tshirt_2 = 0, -- Undershirt
			torso_1 = 301,
			torso_2 = 1, -- Danish Police Shirt (EUP Female)
			decals_1 = 0,
			decals_2 = 0,
			arms = 14,
			pants_1 = 133,
			pants_2 = 0, -- Danish Police Pants (EUP Female)
			shoes_1 = 27,
			shoes_2 = 0, -- Black boots
			helmet_1 = -1,
			helmet_2 = 0, -- No hat
			chain_1 = 0,
			chain_2 = 0,
			ears_1 = -1,
			ears_2 = 0,
			bproof_1 = 0,
			bproof_2 = 0
		}
	},

	sergeant = {
		male = {
			tshirt_1 = 15,
			tshirt_2 = 0, -- Undershirt
			torso_1 = 289,
			torso_2 = 2, -- Danish Police Tactical Shirt (EUP)
			decals_1 = 0,
			decals_2 = 0,
			arms = 11,
			pants_1 = 130,
			pants_2 = 0, -- Danish Police Pants (EUP)
			shoes_1 = 25,
			shoes_2 = 0, -- Black boots
			helmet_1 = -1,
			helmet_2 = 0,
			chain_1 = 0,
			chain_2 = 0,
			ears_1 = -1,
			ears_2 = 0,
			bproof_1 = 18,
			bproof_2 = 0 -- Tactical vest
		},
		female = {
			tshirt_1 = 14,
			tshirt_2 = 0, -- Undershirt
			torso_1 = 302,
			torso_2 = 2, -- Danish Police Tactical Shirt (EUP Female)
			decals_1 = 0,
			decals_2 = 0,
			arms = 14,
			pants_1 = 133,
			pants_2 = 0, -- Danish Police Pants (EUP Female)
			shoes_1 = 27,
			shoes_2 = 0, -- Black boots
			helmet_1 = -1,
			helmet_2 = 0,
			chain_1 = 0,
			chain_2 = 0,
			ears_1 = -1,
			ears_2 = 0,
			bproof_1 = 18,
			bproof_2 = 0 -- Tactical vest
		}
	},

	lieutenant = {
		male = {
			tshirt_1 = 15,
			tshirt_2 = 0, -- Undershirt
			torso_1 = 290,
			torso_2 = 3, -- Danish Police Command Uniform (EUP)
			decals_1 = 0,
			decals_2 = 0,
			arms = 11,
			pants_1 = 130,
			pants_2 = 0, -- Danish Police Pants (EUP)
			shoes_1 = 25,
			shoes_2 = 0, -- Black boots
			helmet_1 = -1,
			helmet_2 = 0,
			chain_1 = 0,
			chain_2 = 0,
			ears_1 = -1,
			ears_2 = 0,
			bproof_1 = 18,
			bproof_2 = 1 -- Command vest
		},
		female = {
			tshirt_1 = 14,
			tshirt_2 = 0, -- Undershirt
			torso_1 = 303,
			torso_2 = 3, -- Danish Police Command Uniform (EUP Female)
			decals_1 = 0,
			decals_2 = 0,
			arms = 14,
			pants_1 = 133,
			pants_2 = 0, -- Danish Police Pants (EUP Female)
			shoes_1 = 27,
			shoes_2 = 0, -- Black boots
			helmet_1 = -1,
			helmet_2 = 0,
			chain_1 = 0,
			chain_2 = 0,
			ears_1 = -1,
			ears_2 = 0,
			bproof_1 = 18,
			bproof_2 = 1 -- Command vest
		}
	},

	boss = {
		male = {
			tshirt_1 = 15,
			tshirt_2 = 0, -- Undershirt
			torso_1 = 291,
			torso_2 = 4, -- Danish Police Chief Uniform (EUP)
			decals_1 = 0,
			decals_2 = 0,
			arms = 11,
			pants_1 = 130,
			pants_2 = 0, -- Danish Police Pants (EUP)
			shoes_1 = 25,
			shoes_2 = 0, -- Black boots
			helmet_1 = 118,
			helmet_2 = 0, -- Danish Police Chief Cap (EUP)
			chain_1 = 0,
			chain_2 = 0,
			ears_1 = -1,
			ears_2 = 0,
			bproof_1 = 0,
			bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,
			tshirt_2 = 0, -- Undershirt
			torso_1 = 304,
			torso_2 = 4, -- Danish Police Chief Uniform (EUP Female)
			decals_1 = 0,
			decals_2 = 0,
			arms = 14,
			pants_1 = 133,
			pants_2 = 0, -- Danish Police Pants (EUP Female)
			shoes_1 = 27,
			shoes_2 = 0, -- Black boots
			helmet_1 = 118,
			helmet_2 = 0, -- Danish Police Chief Cap (EUP)
			chain_1 = 0,
			chain_2 = 0,
			ears_1 = -1,
			ears_2 = 0,
			bproof_1 = 0,
			bproof_2 = 0
		}
	},

	bullet_wear = {
		male = {
			bproof_1 = 18, bproof_2 = 2 -- Danish Police Bulletproof Vest (EUP)
		},
		female = {
			bproof_1 = 18, bproof_2 = 2 -- Danish Police Bulletproof Vest (EUP)
		}
	},

	gilet_wear = {
		male = {
			tshirt_1 = 15, tshirt_2 = 0 -- Undershirt for vest
		},
		female = {
			tshirt_1 = 14, tshirt_2 = 0 -- Undershirt for vest
		}
	}
}
