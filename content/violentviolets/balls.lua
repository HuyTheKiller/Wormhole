local jackpot_playing = false --ear protection
local extrahand_playing = false
local wormhole_playing = false
local hyperspace_playing = false

SMODS.Joker {
    key = "spacecadet",
    rarity = 3,
    cost = 10,
    config = {
        extra = {
            x_mult = 2.25
        }
    },
    ppu_team = { "Violent Violets" },
    ppu_coder = { "Iso", "FireIce" },
    attributes = {"chance", "economy", "hands", "xmult", "retrigger", "space"},
    atlas = 'VVjokers',
    pos = {x = 0, y = 2},
    blueprint_compat = false,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.x_mult,
            }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if SMODS.pseudorandom_probability(card, "c", card.ability.extra.prob, card.ability.extra.odds) then
                if not hyperspace_playing then 
                    play_sound('worm_hyperspace', 1, 1)
                    hyperspace_playing = true
                    G.E_MANAGER:add_event(Event({
                        trigger = "after",
                        delay = 1,
                        blocking = false,
                        blockable = false,
                        func = function()
                            hyperspace_playing = false
                        end
                    }))
                end    
                return {
                    xmult = card.ability.extra.xmult,
                }
            end
        end
    end
}
