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
	config = { extra = { num = 1, den = 2 } },

	loc_vars = function(self, info_queue, card)
		return {
			vars = { self.config.extra.num, self.config.extra.den }
		}
	end,

	calculate = function(self, back, context)
		if context.using_consumeable then
			if context.consumeable and context.consumeable.ability and context.consumeable.ability.set == "Planet" then
				G.E_MANAGER:add_event(Event({
					func = function()
						local num, den = self.config.extra.num, self.config.extra.den

						local r = SMODS.pseudorandom_probability(
							back,
							"cosmos_roll_" .. G.GAME.round_resets.ante,
							num, den,
							"worm_cosmos_deck"
						)
						if not r then return true end

						local pool = SMODS.pseudorandom_probability(
							back,
							"cosmos_pool_roll_" .. G.GAME.round_resets.ante,
							1, 2,
							"worm_cosmos_deck_pool"
						) and "Tarot" or "Spectral"

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
