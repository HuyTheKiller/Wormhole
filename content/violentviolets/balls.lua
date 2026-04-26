local hyperspace_playing = false

SMODS.Joker {
    key = "spacecadet",
    rarity = 3,
    cost = 10,
    config = {
        extra = {
            x_mult = 2.25,
            prob = 1,
            odds = 3
        }
    },
    ppu_team = { "Violent Violets" },
    ppu_coder = { "Iso", "FireIce" },
    attributes = { "chance", "economy", "hands", "xmult", "retrigger", "space" },
    atlas = 'VVjokers',
    pos = { x = 0, y = 2 },
    blueprint_compat = false,
    loc_vars = function(self, info_queue, card)
        local num, denom = SMODS.get_probability_vars(card, card.ability.extra.prob, card.ability.extra.odds)
        return {
            vars = { num, denom, card.ability.extra.x_mult, }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if SMODS.pseudorandom_probability(card, "c", card.ability.extra.prob, card.ability.extra.odds) then
                --[[ G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('worm_hyperspace', 1, .7)
                        return true;
                    end
                })) ]] -- Commented out because it's a very loud and long sound for scoring
                return {
                    xmult = card.ability.extra.x_mult
                }
            end
        end
    end
}
