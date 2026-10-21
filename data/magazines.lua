-- Magazine ammo system.
--
-- enabled      : true  -> an ammo item (e.g. ammo-9) is ONE magazine. Using it loads one full magazine into the
--                         equipped weapon, using it again adds another one, up to `maxMagazines`.
--                false -> stock ox_inventory behaviour (ammo items are single rounds).
-- maxMagazines : how many magazines a weapon can hold in total.
-- sizes        : rounds per magazine for each weapon (weapon item name, uppercase). Weapons not listed use `default`.
--
-- The weapon itself still tracks rounds (metadata.ammo) so shooting/durability work as usual; the server decides
-- how many rounds one ammo item is worth, never the client.
return {
	enabled = true,
	maxMagazines = 3,
	default = 12,

	sizes = {
		-- pistols
		WEAPON_PISTOL = 12,
		WEAPON_PISTOL_MK2 = 12,
		WEAPON_COMBATPISTOL = 12,
		WEAPON_APPISTOL = 18,
		WEAPON_PISTOL50 = 9,
		WEAPON_SNSPISTOL = 6,
		WEAPON_SNSPISTOL_MK2 = 6,
		WEAPON_HEAVYPISTOL = 18,
		WEAPON_VINTAGEPISTOL = 7,
		WEAPON_REVOLVER = 6,
		WEAPON_REVOLVER_MK2 = 6,
		WEAPON_DOUBLEACTION = 6,
		WEAPON_CERAMICPISTOL = 12,
		WEAPON_GADGETPISTOL = 1,
		WEAPON_STUNGUN = 1,
		-- smgs
		WEAPON_MICROSMG = 16,
		WEAPON_SMG = 30,
		WEAPON_SMG_MK2 = 30,
		WEAPON_ASSAULTSMG = 23,
		WEAPON_COMBATPDW = 30,
		WEAPON_MACHINEPISTOL = 12,
		WEAPON_MINISMG = 20,
		-- rifles
		WEAPON_ASSAULTRIFLE = 30,
		WEAPON_ASSAULTRIFLE_MK2 = 30,
		WEAPON_CARBINERIFLE = 30,
		WEAPON_CARBINERIFLE_MK2 = 30,
		WEAPON_ADVANCEDRIFLE = 30,
		WEAPON_SPECIALCARBINE = 30,
		WEAPON_SPECIALCARBINE_MK2 = 30,
		WEAPON_BULLPUPRIFLE = 30,
		WEAPON_BULLPUPRIFLE_MK2 = 30,
		WEAPON_COMPACTRIFLE = 30,
		WEAPON_MILITARYRIFLE = 30,
		-- machine guns
		WEAPON_MG = 54,
		WEAPON_COMBATMG = 100,
		WEAPON_COMBATMG_MK2 = 100,
		WEAPON_GUSENBERG = 30,
		-- shotguns
		WEAPON_PUMPSHOTGUN = 8,
		WEAPON_PUMPSHOTGUN_MK2 = 8,
		WEAPON_SAWNOFFSHOTGUN = 8,
		WEAPON_ASSAULTSHOTGUN = 8,
		WEAPON_BULLPUPSHOTGUN = 14,
		WEAPON_HEAVYSHOTGUN = 6,
		WEAPON_COMBATSHOTGUN = 6,
		WEAPON_MUSKET = 1,
		-- snipers
		WEAPON_SNIPERRIFLE = 10,
		WEAPON_HEAVYSNIPER = 6,
		WEAPON_HEAVYSNIPER_MK2 = 6,
		WEAPON_MARKSMANRIFLE = 8,
		WEAPON_MARKSMANRIFLE_MK2 = 8,
	},
}
