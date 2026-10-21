-- Weapon access + draw animation settings (client side).
--
-- restricted : weapons only the jobs in `groups` may equip. Weapon names are the item names (uppercase).
-- groups     : { jobName = minGrade }. Same format as shop `groups`.
-- civilianDraw : draw animation for pistols when the player is NOT in shared.police (inventory:police convar).
--                { dict, clip, drawMs, dict, clip, holsterMs }. Dicts live in stream/*.ycd.
--
-- NOTE: this is a client-side check (it stops honest players, not cheaters); enforce on the server too
-- if the weapon list matters to you.
return {
	restricted = {
		WEAPON_GLOCK19GEN4 = true,
		WEAPON_STUNGUN = true,
		WEAPON_FLASHLIGHT = true,
		WEAPON_BEANBAG = true,
		WEAPON_NIGHTSTICK = true,
		WEAPON_CARBINERIFLE = true,
		WEAPON_COMBATPDW = true,
	},

	groups = {
		police = 0,
		ambulance = 0,
	},

	civilianDraw = { 'draw1@anim', 'draw1_clip', 1000, 'draw1@anim', 'draw1_clip', 1500 },
}
