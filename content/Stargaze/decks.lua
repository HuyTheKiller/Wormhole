SMODS.Atlas({
	key = "stargaze_deck",
	px = 71,
	py = 95,
	path = "Stargaze/deck.png"
})

SMODS.Back({
	key = "cosmos",
	pos = { x = 0, y = 0 },
	atlas = "stargaze_deck",
	ppu_coder = { "FALATRO" },
	ppu_artist = { "KaitlynTheStampede", "DanielDeisar" },
	ppu_team = { "Stargaze" },
	unlocked = true,

	calculate = function(self, back, context)
		if context.using_consumeable then
			if context.consumeable and context.consumeable.ability and context.consumeable.ability.set == "Planet" then
				G.E_MANAGER:add_event(Event({
					func = function()
						local roll = pseudorandom("cosmos_roll")
						if roll < 0.55 then return true end
						local pool = roll < 0.85 and "Tarot" or "Spectral"
						SMODS.add_card({
							set = pool,
							discover = true,
							bypass_discovery_center = true,
							key_append = "cosmos_roll",
							area = G.consumeables
						})
						return true
					end
				}))
			end
		end
	end,

	apply = function(self, back)
		G.E_MANAGER:add_event(Event({
			func = function()
				SMODS.add_card({ key = "j_space", edition = "e_negative" })
				return true
			end
		}))
	end
})
