return {
	['testburger'] = {
		label = 'Test Burger',
		weight = 220,
		degrade = 60,
		client = {
			image = 'burger_chicken.png',
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			export = 'ox_inventory_examples.testburger'
		},
		server = {
			export = 'ox_inventory_examples.testburger',
			test = 'what an amazingly delicious burger, amirite?'
		},
		buttons = {
			{
				label = 'Lick it',
				action = function(slot)
					print('You licked the burger')
				end
			},
			{
				label = 'Squeeze it',
				action = function(slot)
					print('You squeezed the burger :(')
				end
			},
			{
				label = 'What do you call a vegan burger?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('A misteak.')
				end
			},
			{
				label = 'What do frogs like to eat with their hamburgers?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('French flies.')
				end
			},
			{
				label = 'Why were the burger and fries running?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('Because they\'re fast food.')
				end
			}
		},
		consume = 0.3
	},

	['bandage'] = {
		label = 'Bandage',
		weight = 115,
		client = {
			anim = { dict = 'missheistdockssetup1clipboard@idle_a', clip = 'idle_a', flag = 49 },
			prop = { model = `prop_rolled_sock_02`, pos = vec3(-0.14, -0.14, -0.08), rot = vec3(-50.0, -50.0, 0.0) },
			disable = { move = true, car = true, combat = true },
			usetime = 2500,
		}
	},

	['black_money'] = {
		label = 'Dirty Money',
	},

	['burger'] = {
		label = 'Burger',
		weight = 220,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate a delicious burger'
		},
	},

	['sprunk'] = {
		label = 'Sprunk',
		weight = 350,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_can_01`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'You quenched your thirst with a sprunk'
		}
	},

	['parachute'] = {
		label = 'Parachute',
		weight = 8000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 1500
		}
	},

	['garbage'] = {
		label = 'Garbage',
	},

	['paperbag'] = {
		label = 'Paper Bag',
		weight = 1,
		stack = false,
		close = false,
		consume = 0
	},

	['identification'] = {
		label = 'Identification',
		client = {
			image = 'card_id.png'
		}
	},

	['panties'] = {
		label = 'Knickers',
		weight = 10,
		consume = 0,
		client = {
			status = { thirst = -100000, stress = -25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_cs_panties_02`, pos = vec3(0.03, 0.0, 0.02), rot = vec3(0.0, -13.5, -1.5) },
			usetime = 2500,
		}
	},

	['lockpick'] = {
		label = 'Lockpick',
		weight = 160,
	},
	["phone"] = {
		label = "Phone",
		weight = 190,
		stack = false,
		consume = 0,
		client = {
			export = "lb-phone.UsePhoneItem",
			remove = function()
				TriggerEvent("lb-phone:itemRemoved")
			end,
			add = function()
				TriggerEvent("lb-phone:itemAdded")
			end
		}
	},

	['money'] = {
		label = 'Money',
	},

	['mustard'] = {
		label = 'Mustard',
		weight = 500,
		client = {
			status = { hunger = 25000, thirst = 25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_food_mustard`, pos = vec3(0.01, 0.0, -0.07), rot = vec3(1.0, 1.0, -1.5) },
			usetime = 2500,
			notification = 'You.. drank mustard'
		}
	},

	['water'] = {
		label = 'Water',
		weight = 500,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = 'You drank some refreshing water'
		}
	},

	['radio'] = {
		label = 'Radio',
		weight = 100,
		stack = true,
		close = true,
		client = {
			export = 'ac_radio.openRadio',
			remove = function(total)
				if total < 1 and GetConvar('radio:disconnectWithoutRadio', 'true') == 'true' then
					exports.ac_radio:leaveRadio()
				end
			end
		}
	},

	['armour'] = {
		label = 'Bulletproof Vest',
		weight = 3000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 3500
		}
	},

	['clothing'] = {
		label = 'Clothing',
		consume = 0,
	},

	['mastercard'] = {
		label = 'Fleeca Card',
		stack = false,
		weight = 10,
		client = {
			image = 'card_bank.png'
		}
	},

	['scrapmetal'] = {
		label = 'Scrap Metal',
		weight = 80,
	},

	["alive_chicken"] = {
		label = "Living chicken",
		weight = 1,
		stack = true,
		close = true,
	},

	["blowpipe"] = {
		label = "Blowtorch",
		weight = 2,
		stack = true,
		close = true,
	},

	["bread"] = {
		label = "Bread",
		weight = 1,
		stack = true,
		close = true,
	},

	["cannabis"] = {
		label = "Cannabis",
		weight = 3,
		stack = true,
		close = true,
	},

	["carokit"] = {
		label = "Body Kit",
		weight = 3,
		stack = true,
		close = true,
	},

	["carotool"] = {
		label = "Tools",
		weight = 2,
		stack = true,
		close = true,
	},

	["clothe"] = {
		label = "Cloth",
		weight = 1,
		stack = true,
		close = true,
	},

	["copper"] = {
		label = "Copper",
		weight = 1,
		stack = true,
		close = true,
	},

	["cutted_wood"] = {
		label = "Cut wood",
		weight = 1,
		stack = true,
		close = true,
	},

	["diamond"] = {
		label = "Diamond",
		weight = 1,
		stack = true,
		close = true,
	},

	["essence"] = {
		label = "Gas",
		weight = 1,
		stack = true,
		close = true,
	},

	["fabric"] = {
		label = "Fabric",
		weight = 1,
		stack = true,
		close = true,
	},

	["fish"] = {
		label = "Fish",
		weight = 1,
		stack = true,
		close = true,
	},

	["fixkit"] = {
		label = "Repair Kit",
		weight = 3,
		stack = true,
		close = true,
	},

	["fixtool"] = {
		label = "Repair Tools",
		weight = 2,
		stack = true,
		close = true,
	},

	["gazbottle"] = {
		label = "Gas Bottle",
		weight = 2,
		stack = true,
		close = true,
	},

	["gold"] = {
		label = "Gold",
		weight = 1,
		stack = true,
		close = true,
	},

	["iron"] = {
		label = "Iron",
		weight = 1,
		stack = true,
		close = true,
	},

	["marijuana"] = {
		label = "Marijuana",
		weight = 2,
		stack = true,
		close = true,
	},

	["medikit"] = {
		label = "Medikit",
		weight = 2,
		stack = true,
		close = true,
	},

	["packaged_chicken"] = {
		label = "Chicken fillet",
		weight = 1,
		stack = true,
		close = true,
	},

	["packaged_plank"] = {
		label = "Packaged wood",
		weight = 1,
		stack = true,
		close = true,
	},

	["petrol"] = {
		label = "Oil",
		weight = 1,
		stack = true,
		close = true,
	},

	["petrol_raffin"] = {
		label = "Processed oil",
		weight = 1,
		stack = true,
		close = true,
	},

	["slaughtered_chicken"] = {
		label = "Slaughtered chicken",
		weight = 1,
		stack = true,
		close = true,
	},

	["stone"] = {
		label = "Stone",
		weight = 1,
		stack = true,
		close = true,
	},

	["washed_stone"] = {
		label = "Washed stone",
		weight = 1,
		stack = true,
		close = true,
	},

	["wood"] = {
		label = "Wood",
		weight = 1,
		stack = true,
		close = true,
	},

	["wool"] = {
		label = "Wool",
		weight = 1,
		stack = true,
		close = true,
	},

	["accesscard"] = {
		label = "Access Card",
		weight = 1,
		stack = true,
		close = true,
	},

	["drill"] = {
		label = "Drill",
		weight = 1,
		stack = true,
		close = true,
	},

	["oxygenmask"] = {
		label = "Oxygen Mask",
		weight = 1,
		stack = true,
		close = true,
	},

	["umbrella"] = {
		label = "Umbrella",
		weight = 1,
		stack = true,
		close = true,
	},

	["binoculars"] = {
		label = "Binoculars",
		weight = 1,
		stack = true,
		close = true,
	},

	["thermite"] = {
		label = "Thermite",
		weight = 1,
		stack = true,
		close = true,
	},

	["tacos"] = {
		label = "Tacos",
		weight = 1,
		stack = true,
		close = true,
	},

	["pisswasser"] = {
		label = "Pisswasser",
		weight = 1,
		stack = true,
		close = true,
	},

	["goldbar"] = {
		label = "Gold Bar",
		weight = 1,
		stack = true,
		close = true,
	},

	["goldwatch"] = {
		label = "Gold Watch",
		weight = 1,
		stack = true,
		close = true,
	},

	["hackerDevice"] = {
		label = "Hacker Device",
		weight = 1,
		stack = true,
		close = true,
	},

	["hammerwirecutter"] = {
		label = "Hammer And Wire Cutter",
		weight = 1,
		stack = true,
		close = true,
	},

	["sandwich"] = {
		label = "Sandwich",
		weight = 1,
		stack = true,
		close = true,
	},

	["repairkit"] = {
		label = "Repair Kit",
		weight = 1,
		stack = true,
		close = true,
	},

	["donut"] = {
		label = "Donut",
		weight = 1,
		stack = true,
		close = true,
	},

	["redgull"] = {
		label = "Energy Drink",
		weight = 1,
		stack = true,
		close = true,
	},

	["classic_phone"] = {
		label = "Classic Phone",
		weight = 700,
		stack = false,
		close = true,
		description = "They say that Quasar Smartphone is the same as an iPhone, what do you think?",
		client = { image = "classic_phone.png" }
	},

	["black_phone"] = {
		label = "Black Phone",
		weight = 700,
		stack = false,
		close = true,
		description = "They say that Quasar Smartphone is the same as an iPhone, what do you think?",
		client = { image = "black_phone.png" }
	},

	["blue_phone"] = {
		label = "Blue Phone",
		weight = 700,
		stack = false,
		close = true,
		description = "They say that Quasar Smartphone is the same as an iPhone, what do you think?",
		client = { image = "blue_phone.png" }
	},

	["gold_phone"] = {
		label = "Gold Phone",
		weight = 700,
		stack = false,
		close = true,
		description = "They say that Quasar Smartphone is the same as an iPhone, what do you think?",
		client = { image = "gold_phone.png" }
	},

	["red_phone"] = {
		label = "Red Phone",
		weight = 700,
		stack = false,
		close = true,
		description = "They say that Quasar Smartphone is the same as an iPhone, what do you think?",
		client = { image = "red_phone.png" }
	},

	["green_phone"] = {
		label = "Green Phone",
		weight = 700,
		stack = false,
		close = true,
		description = "They say that Quasar Smartphone is the same as an iPhone, what do you think?",
		client = { image = "green_phone.png" }
	},

	["greenlight_phone"] = {
		label = "Green Light Phone",
		weight = 700,
		stack = false,
		close = true,
		description = "They say that Quasar Smartphone is the same as an iPhone, what do you think?",
		client = { image = "greenlight_phone.png" }
	},

	["pink_phone"] = {
		label = "Pink Phone",
		weight = 700,
		stack = false,
		close = true,
		description = "They say that Quasar Smartphone is the same as an iPhone, what do you think?",
		client = { image = "pink_phone.png" }
	},

	["white_phone"] = {
		label = "White Phone",
		weight = 700,
		stack = false,
		close = true,
		description = "They say that Quasar Smartphone is the same as an iPhone, what do you think?",
		client = { image = "white_phone.png" }
	},

	["phone_hack"] = {
		label = "Phone Hack",
		weight = 300,
		stack = false,
		close = true,
		description = "With this chip, you can access hidden areas of Discord.",
		client = { image = "phone_hack.png" }
	},

	["phone_module"] = {
		label = "Phone Module",
		weight = 300,
		stack = false,
		close = true,
		description = "It seems that we can fix a wet phone with this module, interesting.",
		client = { image = "phone_module.png" }
	},

	["powerbank"] = {
		label = "Power Bank",
		weight = 150,
		stack = false,
		close = true,
		description = "Incredible portable charger!",
		client = { image = "powerbank.png" }
	},

	["wet_phone"] = {
		label = "Wet Phone",
		weight = 700,
		stack = false,
		close = true,
		description = "Did you really think that swimming in the ocean with your phone was a good idea?",
		client = { image = "wet_classic_phone.png" }
	},

	["wet_classic_phone"] = {
		label = "Wet Classic Phone",
		weight = 700,
		stack = false,
		close = true,
		description = "Did you really think that swimming in the ocean with your phone was a good idea?",
		client = { image = "wet_classic_phone.png" }
	},

	["wet_black_phone"] = {
		label = "Wet Black Phone",
		weight = 700,
		stack = false,
		close = true,
		description = "Did you really think that swimming in the ocean with your phone was a good idea?",
		client = { image = "wet_black_phone.png" }
	},

	["wet_blue_phone"] = {
		label = "Wet Blue Phone",
		weight = 700,
		stack = false,
		close = true,
		description = "Did you really think that swimming in the ocean with your phone was a good idea?",
		client = { image = "wet_blue_phone.png" }
	},

	["wet_gold_phone"] = {
		label = "Wet Gold Phone",
		weight = 700,
		stack = false,
		close = true,
		description = "Did you really think that swimming in the ocean with your phone was a good idea?",
		client = { image = "wet_gold_phone.png" }
	},

	["wet_red_phone"] = {
		label = "Wet Red Phone",
		weight = 700,
		stack = false,
		close = true,
		description = "Did you really think that swimming in the ocean with your phone was a good idea?",
		client = { image = "wet_red_phone.png" }
	},

	["wet_green_phone"] = {
		label = "Wet Green Phone",
		weight = 700,
		stack = false,
		close = true,
		description = "Did you really think that swimming in the ocean with your phone was a good idea?",
		client = { image = "wet_green_phone.png" }
	},

	["wet_greenlight_phone"] = {
		label = "Wet Green Light Phone",
		weight = 700,
		stack = false,
		close = true,
		description = "Did you really think that swimming in the ocean with your phone was a good idea?",
		client = { image = "wet_greenlight_phone.png" }
	},

	["wet_pink_phone"] = {
		label = "Wet Pink Phone",
		weight = 700,
		stack = false,
		close = true,
		description = "Did you really think that swimming in the ocean with your phone was a good idea?",
		client = { image = "wet_pink_phone.png" }
	},

	["wet_white_phone"] = {
		label = "Wet White Phone",
		weight = 700,
		stack = false,
		close = true,
		description = "Did you really think that swimming in the ocean with your phone was a good idea?",
		client = { image = "wet_white_phone.png" }
	},

	['stevo_policebadge'] = {
		label = 'Police Badge',
		weight = 250,
		stack = false,
	},
}
