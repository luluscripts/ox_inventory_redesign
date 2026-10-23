return {
	['testburger'] = {
		sound = 'food.wav',
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
		sound = 'cloth.wav',
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
		sound = 'paper.wav',
		label = 'Dirty Money',
	},

	['burger'] = {
		sound = 'food.wav',
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
		sound = 'package.wav',
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
		sound = 'package.wav',
		label = 'Parachute',
		weight = 8000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 1500
		}
	},

	['garbage'] = {
		sound = 'package.wav',
		label = 'Garbage',
	},

	['paperbag'] = {
		sound = 'paper.wav',
		label = 'Paper Bag',
		weight = 1,
		stack = false,
		close = false,
		consume = 0
	},

	['identification'] = {
		sound = 'paper.wav',
		label = 'Identification',
		client = {
			image = 'card_id.png'
		}
	},

	['panties'] = {
		sound = 'package.wav',
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
		sound = 'metal.wav',
		label = 'Lockpick',
		weight = 160,
	},

	['phone'] = {
		sound = 'wood1.wav',
		label = 'Phone',
		weight = 190,
		stack = false,
		consume = 0,
		client = {
			add = function(total)
				if total > 0 then
					pcall(function() return exports.npwd:setPhoneDisabled(false) end)
				end
			end,

			remove = function(total)
				if total < 1 then
					pcall(function() return exports.npwd:setPhoneDisabled(true) end)
				end
			end
		}
	},

	['money'] = {
		sound = 'paper.wav',
		label = 'Money',
	},

	['mustard'] = {
		sound = 'package.wav',
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
		sound = 'drink.wav',
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
		sound = 'wood2.wav',
		label = 'Radio',
		weight = 1000,
		stack = false,
		allowArmed = true
	},

	['armour'] = {
		sound = 'package.wav',
		label = 'Bulletproof Vest',
		weight = 3000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 3500
		}
	},

	['clothing'] = {
		sound = 'cloth.wav',
		label = 'Clothing',
		consume = 0,
	},

	['mastercard'] = {
		sound = 'package.wav',
		label = 'Fleeca Card',
		stack = false,
		weight = 10,
		client = {
			image = 'card_bank.png'
		}
	},

	['scrapmetal'] = {
		sound = 'metal.wav',
		label = 'Scrap Metal',
		weight = 80,
	},

	-- ===== qb-core items =====
	['clip_attachment'] = {
		sound = 'metal.wav',
		label = 'Clip',
		weight = 1000,
		description = 'A clip for a weapon',
	},

	['drum_attachment'] = {
		sound = 'metal.wav',
		label = 'Drum',
		weight = 1000,
		description = 'A drum for a weapon',
	},

	['flashlight_attachment'] = {
		sound = 'metal.wav',
		label = 'Flashlight',
		weight = 1000,
		description = 'A flashlight for a weapon',
	},

	['suppressor_attachment'] = {
		sound = 'metal.wav',
		label = 'Suppressor',
		weight = 1000,
		description = 'A suppressor for a weapon',
	},

	['smallscope_attachment'] = {
		sound = 'metal.wav',
		label = 'Small Scope',
		weight = 1000,
		description = 'A small scope for a weapon',
	},

	['medscope_attachment'] = {
		sound = 'metal.wav',
		label = 'Medium Scope',
		weight = 1000,
		description = 'A medium scope for a weapon',
	},

	['largescope_attachment'] = {
		sound = 'metal.wav',
		label = 'Large Scope',
		weight = 1000,
		description = 'A large scope for a weapon',
	},

	['holoscope_attachment'] = {
		sound = 'metal.wav',
		label = 'Holo Scope',
		weight = 1000,
		description = 'A holo scope for a weapon',
	},

	['advscope_attachment'] = {
		sound = 'metal.wav',
		label = 'Advanced Scope',
		weight = 1000,
		description = 'An advanced scope for a weapon',
	},

	['nvscope_attachment'] = {
		sound = 'metal.wav',
		label = 'Night Vision Scope',
		weight = 1000,
		description = 'A night vision scope for a weapon',
	},

	['thermalscope_attachment'] = {
		sound = 'metal.wav',
		label = 'Thermal Scope',
		weight = 1000,
		description = 'A thermal scope for a weapon',
	},

	['flat_muzzle_brake'] = {
		sound = 'metal.wav',
		label = 'Flat Muzzle Brake',
		weight = 1000,
		description = 'A muzzle brake for a weapon',
	},

	['tactical_muzzle_brake'] = {
		sound = 'metal.wav',
		label = 'Tactical Muzzle Brake',
		weight = 1000,
		description = 'A muzzle brakee for a weapon',
	},

	['fat_end_muzzle_brake'] = {
		sound = 'metal.wav',
		label = 'Fat End Muzzle Brake',
		weight = 1000,
		description = 'A muzzle brake for a weapon',
	},

	['precision_muzzle_brake'] = {
		sound = 'metal.wav',
		label = 'Precision Muzzle Brake',
		weight = 1000,
		description = 'A muzzle brake for a weapon',
	},

	['heavy_duty_muzzle_brake'] = {
		sound = 'metal.wav',
		label = 'HD Muzzle Brake',
		weight = 1000,
		description = 'A muzzle brake for a weapon',
	},

	['slanted_muzzle_brake'] = {
		sound = 'metal.wav',
		label = 'Slanted Muzzle Brake',
		weight = 1000,
		description = 'A muzzle brake for a weapon',
	},

	['split_end_muzzle_brake'] = {
		sound = 'metal.wav',
		label = 'Split End Muzzle Brake',
		weight = 1000,
		description = 'A muzzle brake for a weapon',
	},

	['squared_muzzle_brake'] = {
		sound = 'metal.wav',
		label = 'Squared Muzzle Brake',
		weight = 1000,
		description = 'A muzzle brake for a weapon',
	},

	['bellend_muzzle_brake'] = {
		sound = 'metal.wav',
		label = 'Bellend Muzzle Brake',
		weight = 1000,
		description = 'A muzzle brake for a weapon',
	},

	['barrel_attachment'] = {
		sound = 'metal.wav',
		label = 'Barrel',
		weight = 1000,
		description = 'A barrel for a weapon',
	},

	['grip_attachment'] = {
		sound = 'metal.wav',
		label = 'Grip',
		weight = 1000,
		description = 'A grip for a weapon',
	},

	['comp_attachment'] = {
		sound = 'metal.wav',
		label = 'Compensator',
		weight = 1000,
		description = 'A compensator for a weapon',
	},

	['luxuryfinish_attachment'] = {
		sound = 'metal.wav',
		label = 'Luxury Finish',
		weight = 1000,
		description = 'A luxury finish for a weapon',
	},

	['digicamo_attachment'] = {
		sound = 'metal.wav',
		label = 'Digital Camo',
		weight = 1000,
		description = 'A digital camo for a weapon',
	},

	['brushcamo_attachment'] = {
		sound = 'metal.wav',
		label = 'Brushstroke Camo',
		weight = 1000,
		description = 'A brushstroke camo for a weapon',
	},

	['woodcamo_attachment'] = {
		sound = 'metal.wav',
		label = 'Woodland Camo',
		weight = 1000,
		description = 'A woodland camo for a weapon',
	},

	['skullcamo_attachment'] = {
		sound = 'metal.wav',
		label = 'Skull Camo',
		weight = 1000,
		description = 'A skull camo for a weapon',
	},

	['sessantacamo_attachment'] = {
		sound = 'metal.wav',
		label = 'Sessanta Nove Camo',
		weight = 1000,
		description = 'A sessanta nove camo for a weapon',
	},

	['perseuscamo_attachment'] = {
		sound = 'metal.wav',
		label = 'Perseus Camo',
		weight = 1000,
		description = 'A perseus camo for a weapon',
	},

	['leopardcamo_attachment'] = {
		sound = 'metal.wav',
		label = 'Leopard Camo',
		weight = 1000,
		description = 'A leopard camo for a weapon',
	},

	['zebracamo_attachment'] = {
		sound = 'metal.wav',
		label = 'Zebra Camo',
		weight = 1000,
		description = 'A zebra camo for a weapon',
	},

	['geocamo_attachment'] = {
		sound = 'metal.wav',
		label = 'Geometric Camo',
		weight = 1000,
		description = 'A geometric camo for a weapon',
	},

	['boomcamo_attachment'] = {
		sound = 'metal.wav',
		label = 'Boom Camo',
		weight = 1000,
		description = 'A boom camo for a weapon',
	},

	['patriotcamo_attachment'] = {
		sound = 'metal.wav',
		label = 'Patriot Camo',
		weight = 1000,
		description = 'A patriot camo for a weapon',
	},

	['weapontint_0'] = {
		sound = 'metal.wav',
		label = 'Default Tint',
		weight = 1000,
		description = 'Default/Black Weapon Tint',
		client = { image = 'weapontint_black.png' },
	},

	['weapontint_1'] = {
		sound = 'metal.wav',
		label = 'Green Tint',
		weight = 1000,
		description = 'Green Weapon Tint',
		client = { image = 'weapontint_green.png' },
	},

	['weapontint_2'] = {
		sound = 'metal.wav',
		label = 'Gold Tint',
		weight = 1000,
		description = 'Gold Weapon Tint',
		client = { image = 'weapontint_gold.png' },
	},

	['weapontint_3'] = {
		sound = 'metal.wav',
		label = 'Pink Tint',
		weight = 1000,
		description = 'Pink Weapon Tint',
		client = { image = 'weapontint_pink.png' },
	},

	['weapontint_4'] = {
		sound = 'metal.wav',
		label = 'Army Tint',
		weight = 1000,
		description = 'Army Weapon Tint',
		client = { image = 'weapontint_army.png' },
	},

	['weapontint_5'] = {
		sound = 'metal.wav',
		label = 'LSPD Tint',
		weight = 1000,
		description = 'LSPD Weapon Tint',
		client = { image = 'weapontint_lspd.png' },
	},

	['weapontint_6'] = {
		sound = 'metal.wav',
		label = 'Orange Tint',
		weight = 1000,
		description = 'Orange Weapon Tint',
		client = { image = 'weapontint_orange.png' },
	},

	['weapontint_7'] = {
		sound = 'metal.wav',
		label = 'Platinum Tint',
		weight = 1000,
		description = 'Platinum Weapon Tint',
		client = { image = 'weapontint_plat.png' },
	},

	['weapontint_mk2_0'] = {
		sound = 'metal.wav',
		label = 'Classic Black Tint',
		weight = 1000,
		description = 'Classic Black Weapon Tint for MK2 Weapons',
		client = { image = 'weapontint_black.png' },
	},

	['weapontint_mk2_1'] = {
		sound = 'metal.wav',
		label = 'Classic Gray Tint',
		weight = 1000,
		description = 'Classic Gray Weapon Tint for MK2 Weapons',
		client = { image = 'weapontint_black.png' },
	},

	['weapontint_mk2_2'] = {
		sound = 'metal.wav',
		label = 'Classic Two-Tone Tint',
		weight = 1000,
		description = 'Classic Two-Tone Weapon Tint for MK2 Weapons',
		client = { image = 'weapontint_black.png' },
	},

	['weapontint_mk2_3'] = {
		sound = 'metal.wav',
		label = 'Classic White Tint',
		weight = 1000,
		description = 'Classic White Weapon Tint for MK2 Weapons',
		client = { image = 'weapontint_black.png' },
	},

	['weapontint_mk2_4'] = {
		sound = 'metal.wav',
		label = 'Classic Beige Tint',
		weight = 1000,
		description = 'Classic Beige Weapon Tint for MK2 Weapons',
		client = { image = 'weapontint_black.png' },
	},

	['weapontint_mk2_5'] = {
		sound = 'metal.wav',
		label = 'Classic Green Tint',
		weight = 1000,
		description = 'Classic Green Weapon Tint for MK2 Weapons',
		client = { image = 'weapontint_black.png' },
	},

	['weapontint_mk2_6'] = {
		sound = 'metal.wav',
		label = 'Classic Blue Tint',
		weight = 1000,
		description = 'Classic Blue Weapon Tint for MK2 Weapons',
		client = { image = 'weapontint_black.png' },
	},

	['weapontint_mk2_7'] = {
		sound = 'metal.wav',
		label = 'Classic Earth Tint',
		weight = 1000,
		description = 'Classic Earth Weapon Tint for MK2 Weapons',
		client = { image = 'weapontint_black.png' },
	},

	['weapontint_mk2_8'] = {
		sound = 'metal.wav',
		label = 'Classic Brown & Black Tint',
		weight = 1000,
		description = 'Classic Brown & Black Weapon Tint for MK2 Weapons',
		client = { image = 'weapontint_black.png' },
	},

	['weapontint_mk2_9'] = {
		sound = 'metal.wav',
		label = 'Red Contrast Tint',
		weight = 1000,
		description = 'Red Contrast Weapon Tint for MK2 Weapons',
		client = { image = 'weapontint_black.png' },
	},

	['weapontint_mk2_10'] = {
		sound = 'metal.wav',
		label = 'Blue Contrast Tint',
		weight = 1000,
		description = 'Blue Contrast Weapon Tint for MK2 Weapons',
		client = { image = 'weapontint_black.png' },
	},

	['weapontint_mk2_11'] = {
		sound = 'metal.wav',
		label = 'Yellow Contrast Tint',
		weight = 1000,
		description = 'Yellow Contrast Weapon Tint for MK2 Weapons',
		client = { image = 'weapontint_black.png' },
	},

	['weapontint_mk2_12'] = {
		sound = 'metal.wav',
		label = 'Orange Contrast Tint',
		weight = 1000,
		description = 'Orange Contrast Weapon Tint for MK2 Weapons',
		client = { image = 'weapontint_black.png' },
	},

	['weapontint_mk2_13'] = {
		sound = 'metal.wav',
		label = 'Bold Pink Tint',
		weight = 1000,
		description = 'Bold Pink Weapon Tint for MK2 Weapons',
		client = { image = 'weapontint_black.png' },
	},

	['weapontint_mk2_14'] = {
		sound = 'metal.wav',
		label = 'Bold Purple & Yellow Tint',
		weight = 1000,
		description = 'Bold Purple & Yellow Weapon Tint for MK2 Weapons',
		client = { image = 'weapontint_black.png' },
	},

	['weapontint_mk2_15'] = {
		sound = 'metal.wav',
		label = 'Bold Orange Tint',
		weight = 1000,
		description = 'Bold Orange Weapon Tint for MK2 Weapons',
		client = { image = 'weapontint_black.png' },
	},

	['weapontint_mk2_16'] = {
		sound = 'metal.wav',
		label = 'Bold Green & Purple Tint',
		weight = 1000,
		description = 'Bold Green & Purple Weapon Tint for MK2 Weapons',
		client = { image = 'weapontint_black.png' },
	},

	['weapontint_mk2_17'] = {
		sound = 'metal.wav',
		label = 'Bold Red Features Tint',
		weight = 1000,
		description = 'Bold Red Features Weapon Tint for MK2 Weapons',
		client = { image = 'weapontint_black.png' },
	},

	['weapontint_mk2_18'] = {
		sound = 'metal.wav',
		label = 'Bold Green Features Tint',
		weight = 1000,
		description = 'Bold Green Features Weapon Tint for MK2 Weapons',
		client = { image = 'weapontint_black.png' },
	},

	['weapontint_mk2_19'] = {
		sound = 'metal.wav',
		label = 'Bold Cyan Features Tint',
		weight = 1000,
		description = 'Bold Cyan Features Weapon Tint for MK2 Weapons',
		client = { image = 'weapontint_black.png' },
	},

	['weapontint_mk2_20'] = {
		sound = 'metal.wav',
		label = 'Bold Yellow Features Tint',
		weight = 1000,
		description = 'Bold Yellow Features Weapon Tint for MK2 Weapons',
		client = { image = 'weapontint_black.png' },
	},

	['weapontint_mk2_21'] = {
		sound = 'metal.wav',
		label = 'Bold Red & White Tint',
		weight = 1000,
		description = 'Bold Red & White Weapon Tint for MK2 Weapons',
		client = { image = 'weapontint_black.png' },
	},

	['weapontint_mk2_22'] = {
		sound = 'metal.wav',
		label = 'Bold Blue & White Tint',
		weight = 1000,
		description = 'Bold Blue & White Weapon Tint for MK2 Weapons',
		client = { image = 'weapontint_black.png' },
	},

	['weapontint_mk2_23'] = {
		sound = 'metal.wav',
		label = 'Metallic Gold Tint',
		weight = 1000,
		description = 'Metallic Gold Weapon Tint for MK2 Weapons',
		client = { image = 'weapontint_black.png' },
	},

	['weapontint_mk2_24'] = {
		sound = 'metal.wav',
		label = 'Metallic Platinum Tint',
		weight = 1000,
		description = 'Metallic Platinum Weapon Tint for MK2 Weapons',
		client = { image = 'weapontint_black.png' },
	},

	['weapontint_mk2_25'] = {
		sound = 'metal.wav',
		label = 'Metallic Gray & Lilac Tint',
		weight = 1000,
		description = 'Metallic Gray & Lilac Weapon Tint for MK2 Weapons',
		client = { image = 'weapontint_black.png' },
	},

	['weapontint_mk2_26'] = {
		sound = 'metal.wav',
		label = 'Metallic Purple & Lime Tint',
		weight = 1000,
		description = 'Metallic Purple & Lime Weapon Tint for MK2 Weapons',
		client = { image = 'weapontint_black.png' },
	},

	['weapontint_mk2_27'] = {
		sound = 'metal.wav',
		label = 'Metallic Red Tint',
		weight = 1000,
		description = 'Metallic Red Weapon Tint for MK2 Weapons',
		client = { image = 'weapontint_black.png' },
	},

	['weapontint_mk2_28'] = {
		sound = 'metal.wav',
		label = 'Metallic Green Tint',
		weight = 1000,
		description = 'Metallic Green Weapon Tint for MK2 Weapons',
		client = { image = 'weapontint_black.png' },
	},

	['weapontint_mk2_29'] = {
		sound = 'metal.wav',
		label = 'Metallic Blue Tint',
		weight = 1000,
		description = 'Metallic Blue Weapon Tint for MK2 Weapons',
		client = { image = 'weapontint_black.png' },
	},

	['weapontint_mk2_30'] = {
		sound = 'metal.wav',
		label = 'Metallic White & Aqua Tint',
		weight = 1000,
		description = 'Metallic White & Aqua Weapon Tint for MK2 Weapons',
		client = { image = 'weapontint_black.png' },
	},

	['weapontint_mk2_31'] = {
		sound = 'metal.wav',
		label = 'Metallic Orange & Yellow Tint',
		weight = 1000,
		description = 'Metallic Orange & Yellow Weapon Tint for MK2 Weapons',
		client = { image = 'weapontint_black.png' },
	},

	['weapontint_mk2_32'] = {
		sound = 'metal.wav',
		label = 'Metallic Red and Yellow Tint',
		weight = 1000,
		description = 'Metallic Red and Yellow Weapon Tint for MK2 Weapons',
		client = { image = 'weapontint_black.png' },
	},

	['pistol_ammo'] = {
		sound = 'ammo.wav',
		label = 'Pistol ammo',
		weight = 200,
		description = 'Ammo for Pistols',
	},

	['rifle_ammo'] = {
		sound = 'ammo.wav',
		label = 'Rifle ammo',
		weight = 1000,
		description = 'Ammo for Rifles',
	},

	['smg_ammo'] = {
		sound = 'ammo.wav',
		label = 'SMG ammo',
		weight = 500,
		description = 'Ammo for Sub Machine Guns',
	},

	['shotgun_ammo'] = {
		sound = 'ammo.wav',
		label = 'Shotgun ammo',
		weight = 500,
		description = 'Ammo for Shotguns',
	},

	['mg_ammo'] = {
		sound = 'ammo.wav',
		label = 'MG ammo',
		weight = 1000,
		description = 'Ammo for Machine Guns',
	},

	['snp_ammo'] = {
		sound = 'ammo.wav',
		label = 'Sniper ammo',
		weight = 1000,
		description = 'Ammo for Sniper Rifles',
		client = { image = 'rifle_ammo.png' },
	},

	['emp_ammo'] = {
		sound = 'ammo.wav',
		label = 'EMP Ammo',
		weight = 200,
		description = 'Ammo for EMP Launcher',
	},

	['id_card'] = {
		sound = 'paper.wav',
		label = 'ID Card',
		weight = 0,
		stack = false,
		close = false,
		description = 'A card containing all your information to identify yourself',
	},

	['driver_license'] = {
		sound = 'paper.wav',
		label = 'Drivers License',
		weight = 0,
		stack = false,
		close = false,
		description = 'Permit to show you can drive a vehicle',
	},

	['lawyerpass'] = {
		sound = 'package.wav',
		label = 'Lawyer Pass',
		weight = 0,
		stack = false,
		close = false,
		description = 'Pass exclusive to lawyers to show they can represent a suspect',
	},

	['weaponlicense'] = {
		sound = 'weapon.wav',
		label = 'Weapon License',
		weight = 0,
		stack = false,
		description = 'Weapon License',
		client = { image = 'weapon_license.png' },
	},

	['bank_card'] = {
		sound = 'paper.wav',
		label = 'Bank Card',
		weight = 0,
		stack = false,
		description = 'Used to access ATM',
	},

	['security_card_01'] = {
		sound = 'package.wav',
		label = 'Security Card A',
		weight = 0,
		description = 'A security card... I wonder what it goes to',
	},

	['security_card_02'] = {
		sound = 'package.wav',
		label = 'Security Card B',
		weight = 0,
		description = 'A security card... I wonder what it goes to',
	},

	['tosti'] = {
		sound = 'food.wav',
		label = 'Grilled Cheese Sandwich',
		weight = 200,
		description = 'Nice to eat',
	},

	['twerks_candy'] = {
		sound = 'package.wav',
		label = 'Twerks',
		weight = 100,
		description = 'Some delicious candy :O',
	},

	['snikkel_candy'] = {
		sound = 'package.wav',
		label = 'Snikkel',
		weight = 100,
		description = 'Some delicious candy :O',
	},

	['sandwich'] = {
		sound = 'food.wav',
		label = 'Sandwich',
		weight = 200,
		description = 'Nice bread for your stomach',
	},

	['water_bottle'] = {
		sound = 'drink.wav',
		label = 'Bottle of Water',
		weight = 500,
		description = 'For all the thirsty out there',
	},

	['coffee'] = {
		sound = 'drink.wav',
		label = 'Coffee',
		weight = 200,
		description = 'Pump 4 Caffeine',
	},

	['kurkakola'] = {
		sound = 'drink.wav',
		label = 'Cola',
		weight = 500,
		description = 'For all the thirsty out there',
		client = { image = 'cola.png' },
	},

	['beer'] = {
		sound = 'drink.wav',
		label = 'Beer',
		weight = 500,
		description = 'Nothing like a good cold beer!',
	},

	['whiskey'] = {
		sound = 'drink.wav',
		label = 'Whiskey',
		weight = 500,
		description = 'For all the thirsty out there',
	},

	['vodka'] = {
		sound = 'drink.wav',
		label = 'Vodka',
		weight = 500,
		description = 'For all the thirsty out there',
	},

	['grape'] = {
		sound = 'package.wav',
		label = 'Grape',
		weight = 100,
		close = false,
		description = 'Mmmmh yummie, grapes',
	},

	['wine'] = {
		sound = 'drink.wav',
		label = 'Wine',
		weight = 300,
		close = false,
		description = 'Some good wine to drink on a fine evening',
	},

	['grapejuice'] = {
		sound = 'drink.wav',
		label = 'Grape Juice',
		weight = 200,
		close = false,
		description = 'Grape juice is said to be healthy',
	},

	['joint'] = {
		sound = 'food.wav',
		label = 'Joint',
		weight = 0,
		description = 'Sidney would be very proud at you',
	},

	['cokebaggy'] = {
		sound = 'food.wav',
		label = 'Bag of Coke',
		weight = 0,
		description = 'To get happy real quick',
		client = { image = 'cocaine_baggy.png' },
	},

	['crack_baggy'] = {
		sound = 'paper.wav',
		label = 'Bag of Crack',
		weight = 0,
		description = 'To get happy faster',
	},

	['xtcbaggy'] = {
		sound = 'package.wav',
		label = 'Bag of XTC',
		weight = 0,
		description = 'Pop those pills baby',
		client = { image = 'xtc_baggy.png' },
	},

	['coke_brick'] = {
		sound = 'food.wav',
		label = 'Coke Brick',
		weight = 1000,
		stack = false,
		description = 'Heavy package of cocaine, mostly used for deals and takes a lot of space',
	},

	['weed_brick'] = {
		sound = 'package.wav',
		label = 'Weed Brick',
		weight = 1000,
		description = '1KG Weed Brick to sell to large customers.',
	},

	['coke_small_brick'] = {
		sound = 'food.wav',
		label = 'Coke Package',
		weight = 350,
		stack = false,
		description = 'Small package of cocaine, mostly used for deals and takes a lot of space',
	},

	['oxy'] = {
		sound = 'package.wav',
		label = 'Prescription Oxy',
		weight = 0,
		description = 'The Label Has Been Ripped Off',
	},

	['meth'] = {
		sound = 'food.wav',
		label = 'Meth',
		weight = 100,
		description = 'A baggie of Meth',
		client = { image = 'meth_baggy.png' },
	},

	['rolling_paper'] = {
		sound = 'paper.wav',
		label = 'Rolling Paper',
		weight = 0,
		description = 'Paper made specifically for encasing and smoking tobacco or cannabis.',
	},

	['weed_whitewidow'] = {
		sound = 'paper.wav',
		label = 'White Widow 2g',
		weight = 200,
		close = false,
		description = 'A weed bag with 2g White Widow',
		client = { image = 'weed_baggy.png' },
	},

	['weed_skunk'] = {
		sound = 'cloth.wav',
		label = 'Skunk 2g',
		weight = 200,
		close = false,
		description = 'A weed bag with 2g Skunk',
		client = { image = 'weed_baggy.png' },
	},

	['weed_purplehaze'] = {
		sound = 'paper.wav',
		label = 'Purple Haze 2g',
		weight = 200,
		close = false,
		description = 'A weed bag with 2g Purple Haze',
		client = { image = 'weed_baggy.png' },
	},

	['weed_ogkush'] = {
		sound = 'paper.wav',
		label = 'OGKush 2g',
		weight = 200,
		close = false,
		description = 'A weed bag with 2g OG Kush',
		client = { image = 'weed_baggy.png' },
	},

	['weed_amnesia'] = {
		sound = 'cloth.wav',
		label = 'Amnesia 2g',
		weight = 200,
		close = false,
		description = 'A weed bag with 2g Amnesia',
		client = { image = 'weed_baggy.png' },
	},

	['weed_ak47'] = {
		sound = 'cloth.wav',
		label = 'AK47 2g',
		weight = 200,
		close = false,
		description = 'A weed bag with 2g AK47',
		client = { image = 'weed_baggy.png' },
	},

	['weed_whitewidow_seed'] = {
		sound = 'paper.wav',
		label = 'White Widow Seed',
		weight = 0,
		close = false,
		description = 'A weed seed of White Widow',
		client = { image = 'weed_seed.png' },
	},

	['weed_skunk_seed'] = {
		sound = 'food.wav',
		label = 'Skunk Seed',
		weight = 0,
		description = 'A weed seed of Skunk',
		client = { image = 'weed_seed.png' },
	},

	['weed_purplehaze_seed'] = {
		sound = 'paper.wav',
		label = 'Purple Haze Seed',
		weight = 0,
		description = 'A weed seed of Purple Haze',
		client = { image = 'weed_seed.png' },
	},

	['weed_ogkush_seed'] = {
		sound = 'paper.wav',
		label = 'OGKush Seed',
		weight = 0,
		description = 'A weed seed of OG Kush',
		client = { image = 'weed_seed.png' },
	},

	['weed_amnesia_seed'] = {
		sound = 'food.wav',
		label = 'Amnesia Seed',
		weight = 0,
		description = 'A weed seed of Amnesia',
		client = { image = 'weed_seed.png' },
	},

	['weed_ak47_seed'] = {
		sound = 'food.wav',
		label = 'AK47 Seed',
		weight = 0,
		description = 'A weed seed of AK47',
		client = { image = 'weed_seed.png' },
	},

	['empty_weed_bag'] = {
		sound = 'package.wav',
		label = 'Empty Weed Bag',
		weight = 0,
		description = 'A small empty bag',
		client = { image = 'weed_baggy_empty.png' },
	},

	['weed_nutrition'] = {
		sound = 'food.wav',
		label = 'Plant Fertilizer',
		weight = 2000,
		description = 'Plant nutrition',
	},

	['plastic'] = {
		sound = 'package.wav',
		label = 'Plastic',
		weight = 100,
		close = false,
		description = 'RECYCLE! - Greta Thunberg 2019',
	},

	['metalscrap'] = {
		sound = 'metal.wav',
		label = 'Metal Scrap',
		weight = 100,
		close = false,
		description = 'You can probably make something nice out of this',
	},

	['copper'] = {
		sound = 'metal.wav',
		label = 'Copper',
		weight = 100,
		close = false,
		description = 'Nice piece of metal that you can probably use for something',
	},

	['aluminum'] = {
		sound = 'metal.wav',
		label = 'Aluminium',
		weight = 100,
		close = false,
		description = 'Nice piece of metal that you can probably use for something',
	},

	['aluminumoxide'] = {
		sound = 'package.wav',
		label = 'Aluminium Powder',
		weight = 100,
		close = false,
		description = 'Some powder to mix with',
	},

	['iron'] = {
		sound = 'metal.wav',
		label = 'Iron',
		weight = 100,
		close = false,
		description = 'Handy piece of metal that you can probably use for something',
	},

	['ironoxide'] = {
		sound = 'metal.wav',
		label = 'Iron Powder',
		weight = 100,
		close = false,
		description = 'Some powder to mix with.',
	},

	['steel'] = {
		sound = 'metal.wav',
		label = 'Steel',
		weight = 100,
		close = false,
		description = 'Nice piece of metal that you can probably use for something',
	},

	['rubber'] = {
		sound = 'package.wav',
		label = 'Rubber',
		weight = 100,
		close = false,
		description = 'Rubber, I believe you can make your own rubber ducky with it :D',
	},

	['glass'] = {
		sound = 'metal.wav',
		label = 'Glass',
		weight = 100,
		close = false,
		description = 'It is very fragile, watch out',
	},

	['advancedlockpick'] = {
		sound = 'metal.wav',
		label = 'Advanced Lockpick',
		weight = 500,
		description = 'If you lose your keys a lot this is very useful... Also useful to open your beers',
	},

	['electronickit'] = {
		sound = 'metal.wav',
		label = 'Electronic Kit',
		weight = 100,
		description = 'If you\'ve always wanted to build a robot you can maybe start here. Maybe you\'ll be the new Elon Musk?',
	},

	['gatecrack'] = {
		sound = 'package.wav',
		label = 'Gatecrack',
		weight = 0,
		description = 'Handy software to tear down some fences',
		client = { image = 'usb_device.png' },
	},

	['thermite'] = {
		sound = 'package.wav',
		label = 'Thermite',
		weight = 1000,
		description = 'Sometimes you\'d wish for everything to burn',
	},

	['trojan_usb'] = {
		sound = 'package.wav',
		label = 'Trojan USB',
		weight = 0,
		description = 'Handy software to shut down some systems',
		client = { image = 'usb_device.png' },
	},

	['screwdriverset'] = {
		sound = 'package.wav',
		label = 'Toolkit',
		weight = 1000,
		close = false,
		description = 'Very useful to screw... screws...',
	},

	['drill'] = {
		sound = 'metal.wav',
		label = 'Drill',
		weight = 20000,
		close = false,
		description = 'The real deal...',
	},

	['nitrous'] = {
		sound = 'package.wav',
		label = 'Nitrous',
		weight = 1000,
		description = 'Speed up, gas pedal! :D',
	},

	['repairkit'] = {
		sound = 'package.wav',
		label = 'Repairkit',
		weight = 2500,
		description = 'A nice toolbox with stuff to repair your vehicle',
	},

	['advancedrepairkit'] = {
		sound = 'package.wav',
		label = 'Advanced Repairkit',
		weight = 4000,
		description = 'A nice toolbox with stuff to repair your vehicle',
		client = { image = 'advancedkit.png' },
	},

	['cleaningkit'] = {
		sound = 'package.wav',
		label = 'Cleaning Kit',
		weight = 250,
		description = 'A microfiber cloth with some soap will let your car sparkle again!',
	},

	['tunerlaptop'] = {
		sound = 'metal.wav',
		label = 'Tunerchip',
		weight = 2000,
		stack = false,
		description = 'With this tunerchip you can get your car on steroids... If you know what you\'re doing',
		client = { image = 'tunerchip.png' },
	},

	['harness'] = {
		sound = 'package.wav',
		label = 'Race Harness',
		weight = 1000,
		stack = false,
		description = 'Racing Harness so no matter what you stay in the car',
	},

	['jerry_can'] = {
		sound = 'package.wav',
		label = 'Jerrycan 20L',
		weight = 20000,
		description = 'A can full of Fuel',
	},

	['tirerepairkit'] = {
		sound = 'metal.wav',
		label = 'Tire Repair Kit',
		weight = 1000,
		description = 'A kit to repair your tires',
	},

	['veh_toolbox'] = {
		sound = 'metal.wav',
		label = 'Toolbox',
		weight = 1000,
		description = 'Check vehicle status',
	},

	['veh_armor'] = {
		sound = 'metal.wav',
		label = 'Armor',
		weight = 1000,
		description = 'Upgrade vehicle armor',
	},

	['veh_brakes'] = {
		sound = 'metal.wav',
		label = 'Brakes',
		weight = 1000,
		description = 'Upgrade vehicle brakes',
	},

	['veh_engine'] = {
		sound = 'metal.wav',
		label = 'Engine',
		weight = 1000,
		description = 'Upgrade vehicle engine',
	},

	['veh_suspension'] = {
		sound = 'metal.wav',
		label = 'Suspension',
		weight = 1000,
		description = 'Upgrade vehicle suspension',
	},

	['veh_transmission'] = {
		sound = 'metal.wav',
		label = 'Transmission',
		weight = 1000,
		description = 'Upgrade vehicle transmission',
	},

	['veh_turbo'] = {
		sound = 'metal.wav',
		label = 'Turbo',
		weight = 1000,
		description = 'Install vehicle turbo',
	},

	['veh_interior'] = {
		sound = 'metal.wav',
		label = 'Interior',
		weight = 1000,
		description = 'Upgrade vehicle interior',
	},

	['veh_exterior'] = {
		sound = 'metal.wav',
		label = 'Exterior',
		weight = 1000,
		description = 'Upgrade vehicle exterior',
	},

	['veh_wheels'] = {
		sound = 'metal.wav',
		label = 'Wheels',
		weight = 1000,
		description = 'Upgrade vehicle wheels',
	},

	['veh_neons'] = {
		sound = 'metal.wav',
		label = 'Neons',
		weight = 1000,
		description = 'Upgrade vehicle neons',
	},

	['veh_xenons'] = {
		sound = 'metal.wav',
		label = 'Xenons',
		weight = 1000,
		description = 'Upgrade vehicle xenons',
	},

	['veh_tint'] = {
		sound = 'metal.wav',
		label = 'Tints',
		weight = 1000,
		description = 'Install vehicle tint',
	},

	['veh_plates'] = {
		sound = 'metal.wav',
		label = 'Plates',
		weight = 1000,
		description = 'Install vehicle plates',
	},

	['firstaid'] = {
		sound = 'package.wav',
		label = 'First Aid',
		weight = 2500,
		description = 'You can use this First Aid kit to get people back on their feet',
	},

	['ifaks'] = {
		sound = 'ammo.wav',
		label = 'ifaks',
		weight = 200,
		description = 'ifaks for healing and a complete stress remover.',
	},

	['painkillers'] = {
		sound = 'pill.wav',
		label = 'Painkillers',
		weight = 0,
		description = 'For pain you can\'t stand anymore, take this pill that\'d make you feel great again',
	},

	['walkstick'] = {
		sound = 'wood1.wav',
		label = 'Walking Stick',
		weight = 1000,
		description = 'Walking stick for ya\'ll grannies out there.. HAHA',
	},

	['lftablet'] = {
		sound = 'metal.wav',
		label = 'LonelyFans Tablet',
		weight = 500,
		description = 'Opens the LonelyFans app anywhere.',
		client = { image = 'lftablet.webp' },
	},

	['iphone'] = {
		sound = 'wood1.wav',
		label = 'iPhone',
		weight = 1000,
		description = 'Very expensive phone',
	},

	['samsungphone'] = {
		sound = 'wood1.wav',
		label = 'Samsung S10',
		weight = 1000,
		description = 'Very expensive phone',
	},

	['laptop'] = {
		sound = 'metal.wav',
		label = 'Laptop',
		weight = 4000,
		description = 'Expensive laptop',
	},

	['tablet'] = {
		sound = 'metal.wav',
		label = 'Tablet',
		weight = 2000,
		description = 'Expensive tablet',
	},

	['fitbit'] = {
		sound = 'metal.wav',
		label = 'Fitbit',
		weight = 500,
		stack = false,
		description = 'I like fitbit',
	},

	['radioscanner'] = {
		sound = 'wood2.wav',
		label = 'Radio Scanner',
		weight = 1000,
		description = 'With this you can get some police alerts. Not 100% effective however',
	},

	['pinger'] = {
		sound = 'metal.wav',
		label = 'Pinger',
		weight = 1000,
		description = 'With a pinger and your phone you can send out your location',
	},

	['cryptostick'] = {
		sound = 'paper.wav',
		label = 'Crypto Stick',
		weight = 200,
		stack = false,
		description = 'Why would someone ever buy money that doesn\'t exist.. How many would it contain..?',
	},

	['rolex'] = {
		sound = 'metal.wav',
		label = 'Golden Watch',
		weight = 1500,
		description = 'A golden watch seems like the jackpot to me!',
	},

	['diamond_ring'] = {
		sound = 'bag.wav',
		label = 'Diamond Ring',
		weight = 1500,
		description = 'A diamond ring seems like the jackpot to me!',
	},

	['diamond'] = {
		sound = 'bag.wav',
		label = 'Diamond',
		weight = 1000,
		description = 'A diamond seems like the jackpot to me!',
	},

	['goldchain'] = {
		sound = 'metal.wav',
		label = 'Golden Chain',
		weight = 1500,
		description = 'A golden chain seems like the jackpot to me!',
	},

	['tenkgoldchain'] = {
		sound = 'metal.wav',
		label = '10k Gold Chain',
		weight = 2000,
		description = '10 carat golden chain',
		client = { image = '10kgoldchain.png' },
	},

	['goldbar'] = {
		sound = 'metal.wav',
		label = 'Gold Bar',
		weight = 7000,
		description = 'Looks pretty expensive to me',
	},

	['armor'] = {
		sound = 'package.wav',
		label = 'Armor',
		weight = 5000,
		description = 'Some protection won\'t hurt... right?',
	},

	['heavyarmor'] = {
		sound = 'package.wav',
		label = 'Heavy Armor',
		weight = 5000,
		description = 'Some protection won\'t hurt... right?',
		client = { image = 'armor.png' },
	},

	['handcuffs'] = {
		sound = 'metal.wav',
		label = 'Handcuffs',
		weight = 100,
		description = 'Comes in handy when people misbehave. Maybe it can be used for something else?',
	},

	['police_stormram'] = {
		sound = 'package.wav',
		label = 'Stormram',
		weight = 18000,
		description = 'A nice tool to break into doors',
	},

	['empty_evidence_bag'] = {
		sound = 'package.wav',
		label = 'Empty Evidence Bag',
		weight = 0,
		close = false,
		description = 'Used a lot to keep DNA from blood, bullet shells and more',
		client = { image = 'evidence.png' },
	},

	['filled_evidence_bag'] = {
		sound = 'package.wav',
		label = 'Evidence Bag',
		weight = 200,
		stack = false,
		close = false,
		description = 'A filled evidence bag to see who committed the crime >:(',
		client = { image = 'evidence.png' },
	},

	['firework1'] = {
		sound = 'package.wav',
		label = '2Brothers',
		weight = 1000,
		description = 'Fireworks',
	},

	['firework2'] = {
		sound = 'package.wav',
		label = 'Poppelers',
		weight = 1000,
		description = 'Fireworks',
	},

	['firework3'] = {
		sound = 'package.wav',
		label = 'WipeOut',
		weight = 1000,
		description = 'Fireworks',
	},

	['firework4'] = {
		sound = 'package.wav',
		label = 'Weeping Willow',
		weight = 1000,
		description = 'Fireworks',
	},

	['dendrogyra_coral'] = {
		sound = 'package.wav',
		label = 'Dendrogyra',
		weight = 1000,
		description = 'Its also known as pillar coral',
	},

	['antipatharia_coral'] = {
		sound = 'package.wav',
		label = 'Antipatharia',
		weight = 1000,
		description = 'Its also known as black corals or thorn corals',
	},

	['diving_gear'] = {
		sound = 'package.wav',
		label = 'Diving Gear',
		weight = 30000,
		stack = false,
		description = 'An oxygen tank and a rebreather',
	},

	['diving_fill'] = {
		sound = 'package.wav',
		label = 'Diving Tube',
		weight = 3000,
		stack = false,
		description = 'An oxygen tube and a rebreather',
		client = { image = 'diving_tube.png' },
	},

	['casinochips'] = {
		sound = 'metal.wav',
		label = 'Casino Chips',
		weight = 0,
		close = false,
		description = 'Chips For Casino Gambling',
	},

	['stickynote'] = {
		sound = 'package.wav',
		label = 'Sticky note',
		weight = 0,
		stack = false,
		close = false,
		description = 'Sometimes handy to remember something :)',
	},

	['moneybag'] = {
		sound = 'paper.wav',
		label = 'Money Bag',
		weight = 0,
		stack = false,
		description = 'A bag with cash',
	},

	['binoculars'] = {
		sound = 'package.wav',
		label = 'Binoculars',
		weight = 600,
		description = 'Sneaky Breaky...',
	},

	['lighter'] = {
		sound = 'package.wav',
		label = 'Lighter',
		weight = 0,
		description = 'On new years eve a nice fire to stand next to',
	},

	['certificate'] = {
		sound = 'package.wav',
		label = 'Certificate',
		weight = 0,
		description = 'Certificate that proves you own certain stuff',
	},

	['markedbills'] = {
		sound = 'paper.wav',
		label = 'Marked Money',
		weight = 1000,
		stack = false,
		description = 'Money?',
	},

	['labkey'] = {
		sound = 'paper.wav',
		label = 'Key',
		weight = 500,
		stack = false,
		description = 'Key for a lock...?',
	},

	['printerdocument'] = {
		sound = 'paper.wav',
		label = 'Document',
		weight = 500,
		stack = false,
		description = 'A nice document',
	},

	['newscam'] = {
		sound = 'metal.wav',
		label = 'News Camera',
		weight = 100,
		stack = false,
		description = 'A camera for the news',
	},

	['newsmic'] = {
		sound = 'metal.wav',
		label = 'News Microphone',
		weight = 100,
		stack = false,
		description = 'A microphone for the news',
	},

	['newsbmic'] = {
		sound = 'metal.wav',
		label = 'Boom Microphone',
		weight = 100,
		stack = false,
		description = 'A Useable BoomMic',
	},

	-- ===== lulu_boosting =====
	['boostingtablet'] = { sound = 'metal.wav', label = 'Boosting Tablet', weight = 500, stack = false, close = true, consume = 0,
		client = { image = 'tablet1.png' } },
	['hackingdevice'] = { sound = 'package.wav', label = 'Hacking Device', weight = 500, stack = false, close = true, consume = 0,
		client = { image = 'hacking_device.png' } },
	['gpshackingdevice'] = { sound = 'metal.wav', label = 'GPS Hacking Device', weight = 500, stack = false, close = true, consume = 0,
		client = { image = 'gps_hacking_device.png' } },

	-- lulu_petshop
	['pet_food'] = {
	    label = 'Pet Food',
	    weight = 250,
	    stack = true,
	    close = true,
	    consume = 1,
	    description = 'Feeds the pet next to you.',
	    server = { export = 'lulu_petshop.useItem' },
	},

	['pet_water'] = {
	    label = 'Pet Water',
	    weight = 300,
	    stack = true,
	    close = true,
	    consume = 1,
	    description = 'Quenches the thirst of the pet next to you.',
	    server = { export = 'lulu_petshop.useItem' },
	},

	['pet_revive'] = {
	    label = 'Pet Medkit',
	    weight = 500,
	    stack = true,
	    close = true,
	    consume = 1,
	    description = 'Heals the wounds of the pet next to you.',
	    server = { export = 'lulu_petshop.useItem' },
	},

	['pet_bed_bones'] = {
	    label = 'Bone Bed',
	    weight = 1500,
	    stack = true,
	    close = true,
	    consume = 0,
	    description = 'Place it in the world, your pet can lie on it.',
	    server = { export = 'lulu_petshop.useItem' },
	},

	['pet_bed_old'] = {
	    label = 'Classic Bed',
	    weight = 1500,
	    stack = true,
	    close = true,
	    consume = 0,
	    description = 'Place it in the world, your pet can lie on it.',
	    server = { export = 'lulu_petshop.useItem' },
	},

	['pet_bed_plaid'] = {
	    label = 'Plaid Bed',
	    weight = 1500,
	    stack = true,
	    close = true,
	    consume = 0,
	    description = 'Place it in the world, your pet can lie on it.',
	    server = { export = 'lulu_petshop.useItem' },
	},

	['pet_bed_small_1'] = {
	    label = 'Small Bed 1',
	    weight = 1500,
	    stack = true,
	    close = true,
	    consume = 0,
	    description = 'Place it in the world, your pet can lie on it.',
	    server = { export = 'lulu_petshop.useItem' },
	},

	['pet_bed_small_2'] = {
	    label = 'Small Bed 2',
	    weight = 1500,
	    stack = true,
	    close = true,
	    consume = 0,
	    description = 'Place it in the world, your pet can lie on it.',
	    server = { export = 'lulu_petshop.useItem' },
	},

	['pet_bed_small_3'] = {
	    label = 'Small Bed 3',
	    weight = 1500,
	    stack = true,
	    close = true,
	    consume = 0,
	    description = 'Place it in the world, your pet can lie on it.',
	    server = { export = 'lulu_petshop.useItem' },
	},

	['pet_bed_round_1'] = {
	    label = 'Round Bed 1',
	    weight = 1500,
	    stack = true,
	    close = true,
	    consume = 0,
	    description = 'Place it in the world, your pet can lie on it.',
	    server = { export = 'lulu_petshop.useItem' },
	},

	['pet_bed_round_2'] = {
	    label = 'Round Bed 2',
	    weight = 1500,
	    stack = true,
	    close = true,
	    consume = 0,
	    description = 'Place it in the world, your pet can lie on it.',
	    server = { export = 'lulu_petshop.useItem' },
	},

	['pet_bed_round_3'] = {
	    label = 'Round Bed 3',
	    weight = 1500,
	    stack = true,
	    close = true,
	    consume = 0,
	    description = 'Place it in the world, your pet can lie on it.',
	    server = { export = 'lulu_petshop.useItem' },
	},





	['pet_ball'] = {
	    label = 'Ball',
	    weight = 100,
	    stack = true,
	    close = true,
	    consume = 0,
	    description = 'Throw it, your dog brings it back.',
	    server = { export = 'lulu_petshop.useItem' },
	},

	['pet_bag_cat'] = {
	    label = 'Cat Carrier',
	    weight = 1200,
	    stack = true,
	    close = true,
	    consume = 0,
	    description = 'Wear it on your back and carry your pet inside.',
	    server = { export = 'lulu_petshop.useItem' },
	},

	['pet_bag_dog'] = {
	    label = 'Dog Carrier',
	    weight = 1200,
	    stack = true,
	    close = true,
	    consume = 0,
	    description = 'Wear it on your back and carry your pet inside.',
	    server = { export = 'lulu_petshop.useItem' },
	},

	['pet_bag_bigdog'] = {
	    label = 'Large Dog Carrier',
	    weight = 1200,
	    stack = true,
	    close = true,
	    consume = 0,
	    description = 'Wear it on your back and carry your pet inside.',
	    server = { export = 'lulu_petshop.useItem' },
	},

	['pet_leash_1'] = {
	    label = 'Leash 1',
	    weight = 300,
	    stack = true,
	    close = true,
	    consume = 0,
	    description = 'A decorative leash line you can place.',
	    server = { export = 'lulu_petshop.useItem' },
	},

	['pet_leash_2'] = {
	    label = 'Leash 2',
	    weight = 300,
	    stack = true,
	    close = true,
	    consume = 0,
	    description = 'A decorative leash line you can place.',
	    server = { export = 'lulu_petshop.useItem' },
	},

	['pet_leash_3'] = {
	    label = 'Leash 3',
	    weight = 300,
	    stack = true,
	    close = true,
	    consume = 0,
	    description = 'A decorative leash line you can place.',
	    server = { export = 'lulu_petshop.useItem' },
	},

	-- lulu_buddy
	['lulu_buddy_trio_red'] = {
		label = 'Trio · Red',
		weight = 200,
		stack = false,
		close = true,
		description = 'Lulu Buddy collectible toy',
		client = { export = 'lulu_buddy.useToy', image = 'nui://lulu_buddy/nui/assets/proppics/lulu_buddy_trio_red.webp' },
	},
	['lulu_buddy_trio_green'] = {
		label = 'Trio · Green',
		weight = 200,
		stack = false,
		close = true,
		description = 'Lulu Buddy collectible toy',
		client = { export = 'lulu_buddy.useToy', image = 'nui://lulu_buddy/nui/assets/proppics/lulu_buddy_trio_green.webp' },
	},
	['lulu_buddy_trio_blue'] = {
		label = 'Trio · Blue',
		weight = 200,
		stack = false,
		close = true,
		description = 'Lulu Buddy collectible toy',
		client = { export = 'lulu_buddy.useToy', image = 'nui://lulu_buddy/nui/assets/proppics/lulu_buddy_trio_blue.webp' },
	},
	['lulu_buddy_lemur'] = {
		label = 'Lemur',
		weight = 200,
		stack = false,
		close = true,
		description = 'Lulu Buddy collectible toy',
		client = { export = 'lulu_buddy.useToy', image = 'nui://lulu_buddy/nui/assets/proppics/lulu_buddy_lemur.webp' },
	},
	['lulu_buddy_penguin'] = {
		label = 'Penguin',
		weight = 200,
		stack = false,
		close = true,
		description = 'Lulu Buddy collectible toy',
		client = { export = 'lulu_buddy.useToy', image = 'nui://lulu_buddy/nui/assets/proppics/lulu_buddy_penguin.webp' },
	},
	['lulu_buddy_yellow_mini'] = {
		label = 'Yellow Mini',
		weight = 200,
		stack = false,
		close = true,
		description = 'Lulu Buddy collectible toy',
		client = { export = 'lulu_buddy.useToy', image = 'nui://lulu_buddy/nui/assets/proppics/lulu_buddy_yellow_mini.webp' },
	},
	['lulu_buddy_little_girl'] = {
		label = 'Little Girl',
		weight = 200,
		stack = false,
		close = true,
		description = 'Lulu Buddy collectible toy',
		client = { export = 'lulu_buddy.useToy', image = 'nui://lulu_buddy/nui/assets/proppics/lulu_buddy_little_girl.webp' },
	},
	['lulu_buddy_blue_kid'] = {
		label = 'Blue Kid',
		weight = 200,
		stack = false,
		close = true,
		description = 'Lulu Buddy collectible toy',
		client = { export = 'lulu_buddy.useToy', image = 'nui://lulu_buddy/nui/assets/proppics/lulu_buddy_blue_kid.webp' },
	},
	['lulu_buddy_white_bunny'] = {
		label = 'White Bunny',
		weight = 200,
		stack = false,
		close = true,
		description = 'Lulu Buddy collectible toy',
		client = { export = 'lulu_buddy.useToy', image = 'nui://lulu_buddy/nui/assets/proppics/lulu_buddy_white_bunny.webp' },
	},
	['lulu_buddy_blue_fluff'] = {
		label = 'Blue Fluff',
		weight = 200,
		stack = false,
		close = true,
		description = 'Lulu Buddy collectible toy',
		client = { export = 'lulu_buddy.useToy', image = 'nui://lulu_buddy/nui/assets/proppics/lulu_buddy_blue_fluff.webp' },
	},
	['lulu_buddy_panda'] = {
		label = 'Panda',
		weight = 200,
		stack = false,
		close = true,
		description = 'Lulu Buddy collectible toy',
		client = { export = 'lulu_buddy.useToy', image = 'nui://lulu_buddy/nui/assets/proppics/lulu_buddy_panda.webp' },
	},
	['lulu_buddy_bear'] = {
		label = 'Bear',
		weight = 200,
		stack = false,
		close = true,
		description = 'Lulu Buddy collectible toy',
		client = { export = 'lulu_buddy.useToy', image = 'nui://lulu_buddy/nui/assets/proppics/lulu_buddy_bear.webp' },
	},
	['lulu_buddy_bird'] = {
		label = 'Bird',
		weight = 200,
		stack = false,
		close = true,
		description = 'Lulu Buddy collectible toy',
		client = { export = 'lulu_buddy.useToy', image = 'nui://lulu_buddy/nui/assets/proppics/lulu_buddy_bird.webp' },
	},
	['lulu_buddy_blue_monster'] = {
		label = 'Blue Monster',
		weight = 200,
		stack = false,
		close = true,
		description = 'Lulu Buddy collectible toy',
		client = { export = 'lulu_buddy.useToy', image = 'nui://lulu_buddy/nui/assets/proppics/lulu_buddy_blue_monster.webp' },
	},
	['lulu_buddy_pink_monster'] = {
		label = 'Pink Monster',
		weight = 200,
		stack = false,
		close = true,
		description = 'Lulu Buddy collectible toy',
		client = { export = 'lulu_buddy.useToy', image = 'nui://lulu_buddy/nui/assets/proppics/lulu_buddy_pink_monster.webp' },
	},
	['lulu_buddy_hedgehog'] = {
		label = 'Hedgehog',
		weight = 200,
		stack = false,
		close = true,
		description = 'Lulu Buddy collectible toy',
		client = { export = 'lulu_buddy.useToy', image = 'nui://lulu_buddy/nui/assets/proppics/lulu_buddy_hedgehog.webp' },
	},
	['lulu_buddy_gecko'] = {
		label = 'Gecko',
		weight = 200,
		stack = false,
		close = true,
		description = 'Lulu Buddy collectible toy',
		client = { export = 'lulu_buddy.useToy', image = 'nui://lulu_buddy/nui/assets/proppics/lulu_buddy_gecko.webp' },
	},
	['lulu_buddy_silver_girl'] = {
		label = 'Silver-Haired Girl',
		weight = 200,
		stack = false,
		close = true,
		description = 'Lulu Buddy collectible toy',
		client = { export = 'lulu_buddy.useToy', image = 'nui://lulu_buddy/nui/assets/proppics/lulu_buddy_silver_girl.webp' },
	},
	['lulu_buddy_cat'] = {
		label = 'Cat',
		weight = 200,
		stack = false,
		close = true,
		description = 'Lulu Buddy collectible toy',
		client = { export = 'lulu_buddy.useToy', image = 'nui://lulu_buddy/nui/assets/proppics/lulu_buddy_cat.webp' },
	},
	['lulu_buddy_fox'] = {
		label = 'Fox',
		weight = 200,
		stack = false,
		close = true,
		description = 'Lulu Buddy collectible toy',
		client = { export = 'lulu_buddy.useToy', image = 'nui://lulu_buddy/nui/assets/proppics/lulu_buddy_fox.webp' },
	},
	['lulu_buddy_otter'] = {
		label = 'Otter',
		weight = 200,
		stack = false,
		close = true,
		description = 'Lulu Buddy collectible toy',
		client = { export = 'lulu_buddy.useToy', image = 'nui://lulu_buddy/nui/assets/proppics/lulu_buddy_otter.webp' },
	},
	['lulu_buddy_girl'] = {
		label = 'Girl Figure',
		weight = 200,
		stack = false,
		close = true,
		description = 'Lulu Buddy collectible toy',
		client = { export = 'lulu_buddy.useToy', image = 'nui://lulu_buddy/nui/assets/proppics/lulu_buddy_girl.webp' },
	},
	['lulu_buddy_teddy'] = {
		label = 'Teddy',
		weight = 200,
		stack = false,
		close = true,
		description = 'Lulu Buddy collectible toy',
		client = { export = 'lulu_buddy.useToy', image = 'nui://lulu_buddy/nui/assets/proppics/lulu_buddy_teddy.webp' },
	},
	['lulu_buddy_dark_bunny'] = {
		label = 'Dark Bunny',
		weight = 200,
		stack = false,
		close = true,
		description = 'Lulu Buddy collectible toy',
		client = { export = 'lulu_buddy.useToy', image = 'nui://lulu_buddy/nui/assets/proppics/lulu_buddy_dark_bunny.webp' },
	},
	['lulu_buddy_dark_bear'] = {
		label = 'Dark Bear',
		weight = 200,
		stack = false,
		close = true,
		description = 'Lulu Buddy collectible toy',
		client = { export = 'lulu_buddy.useToy', image = 'nui://lulu_buddy/nui/assets/proppics/lulu_buddy_dark_bear.webp' },
	},
	['lulu_buddy_panda_cub'] = {
		label = 'Panda Cub',
		weight = 200,
		stack = false,
		close = true,
		description = 'Lulu Buddy collectible toy',
		client = { export = 'lulu_buddy.useToy', image = 'nui://lulu_buddy/nui/assets/proppics/lulu_buddy_panda_cub.webp' },
	},
	['lulu_buddy_box_pup'] = {
		label = 'Box Pup',
		weight = 200,
		stack = false,
		close = true,
		description = 'Lulu Buddy collectible toy',
		client = { export = 'lulu_buddy.useToy', image = 'nui://lulu_buddy/nui/assets/proppics/lulu_buddy_box_pup.webp' },
	},
	['lulu_buddy_giraffe'] = {
		label = 'Giraffe',
		weight = 200,
		stack = false,
		close = true,
		description = 'Lulu Buddy collectible toy',
		client = { export = 'lulu_buddy.useToy', image = 'nui://lulu_buddy/nui/assets/proppics/lulu_buddy_giraffe.webp' },
	},
	['lulu_buddy_zebra'] = {
		label = 'Zebra',
		weight = 200,
		stack = false,
		close = true,
		description = 'Lulu Buddy collectible toy',
		client = { export = 'lulu_buddy.useToy', image = 'nui://lulu_buddy/nui/assets/proppics/lulu_buddy_zebra.webp' },
	},
	['lulu_buddy_cloud'] = {
		label = 'Cloud',
		weight = 200,
		stack = false,
		close = true,
		description = 'Lulu Buddy collectible toy',
		client = { export = 'lulu_buddy.useToy', image = 'nui://lulu_buddy/nui/assets/proppics/lulu_buddy_cloud.webp' },
	},
	['lulu_buddy_blue_piggy'] = {
		label = 'Blue Piggy',
		weight = 200,
		stack = false,
		close = true,
		description = 'Lulu Buddy collectible toy',
		client = { export = 'lulu_buddy.useToy', image = 'nui://lulu_buddy/nui/assets/proppics/lulu_buddy_blue_piggy.webp' },
	},
	['lulu_buddy_alpaca'] = {
		label = 'Alpaca',
		weight = 200,
		stack = false,
		close = true,
		description = 'Lulu Buddy collectible toy',
		client = { export = 'lulu_buddy.useToy', image = 'nui://lulu_buddy/nui/assets/proppics/lulu_buddy_alpaca.webp' },
	},
	['lulu_buddy_frog_king'] = {
		label = 'Frog King',
		weight = 200,
		stack = false,
		close = true,
		description = 'Lulu Buddy collectible toy',
		client = { export = 'lulu_buddy.useToy', image = 'nui://lulu_buddy/nui/assets/proppics/lulu_buddy_frog_king.webp' },
	},
	['lulu_buddy_bear_duo'] = {
		label = 'Bear Duo',
		weight = 200,
		stack = false,
		close = true,
		description = 'Lulu Buddy collectible toy',
		client = { export = 'lulu_buddy.useToy', image = 'nui://lulu_buddy/nui/assets/proppics/lulu_buddy_bear_duo.webp' },
	},
	['lulu_buddy_grey_lamb'] = {
		label = 'Grey Lamb',
		weight = 200,
		stack = false,
		close = true,
		description = 'Lulu Buddy collectible toy',
		client = { export = 'lulu_buddy.useToy', image = 'nui://lulu_buddy/nui/assets/proppics/lulu_buddy_grey_lamb.webp' },
	},
	['lulu_buddy_orange_dino'] = {
		label = 'Orange Dino',
		weight = 200,
		stack = false,
		close = true,
		description = 'Lulu Buddy collectible toy',
		client = { export = 'lulu_buddy.useToy', image = 'nui://lulu_buddy/nui/assets/proppics/lulu_buddy_orange_dino.webp' },
	},
	['lulu_buddy_wolf_pup'] = {
		label = 'Wolf Pup',
		weight = 200,
		stack = false,
		close = true,
		description = 'Lulu Buddy collectible toy',
		client = { export = 'lulu_buddy.useToy', image = 'nui://lulu_buddy/nui/assets/proppics/lulu_buddy_wolf_pup.webp' },
	},
	['lulu_buddy_cow'] = {
		label = 'Cow',
		weight = 200,
		stack = false,
		close = true,
		description = 'Lulu Buddy collectible toy',
		client = { export = 'lulu_buddy.useToy', image = 'nui://lulu_buddy/nui/assets/proppics/lulu_buddy_cow.webp' },
	},
	['lulu_buddy_long_neck'] = {
		label = 'Long-Neck Dino',
		weight = 200,
		stack = false,
		close = true,
		description = 'Lulu Buddy collectible toy',
		client = { export = 'lulu_buddy.useToy', image = 'nui://lulu_buddy/nui/assets/proppics/lulu_buddy_long_neck.webp' },
	},
	['lulu_buddy_green_turtle'] = {
		label = 'Green Turtle',
		weight = 200,
		stack = false,
		close = true,
		description = 'Lulu Buddy collectible toy',
		client = { export = 'lulu_buddy.useToy', image = 'nui://lulu_buddy/nui/assets/proppics/lulu_buddy_green_turtle.webp' },
	},
	['lulu_buddy_puppy'] = {
		label = 'Puppy',
		weight = 200,
		stack = false,
		close = true,
		description = 'Lulu Buddy collectible toy',
		client = { export = 'lulu_buddy.useToy', image = 'nui://lulu_buddy/nui/assets/proppics/lulu_buddy_puppy.webp' },
	},
	['lulu_buddy_anteater'] = {
		label = 'Anteater',
		weight = 200,
		stack = false,
		close = true,
		description = 'Lulu Buddy collectible toy',
		client = { export = 'lulu_buddy.useToy', image = 'nui://lulu_buddy/nui/assets/proppics/lulu_buddy_anteater.webp' },
	},
	['lulu_buddy_duckling'] = {
		label = 'Duckling',
		weight = 200,
		stack = false,
		close = true,
		description = 'Lulu Buddy collectible toy',
		client = { export = 'lulu_buddy.useToy', image = 'nui://lulu_buddy/nui/assets/proppics/lulu_buddy_duckling.webp' },
	},
}
