SMODS.Joker({
    key = 'riverboat_event_horizon',
    atlas = 'worm_jokers',
    pos = { x = 2, y = 1 },
    rarity = 2,
    cost = 10,
    blueprint_compat = true,
    discovered = true,
    config = { extra = { x_mult = 1, gain = 0.3 } },
    ppu_coder = { "fooping" },
    ppu_artist = { "fooping" },
    ppu_team = { "riverboat" },
    attributes = { "xmult", "scaling", "reset", "space" },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.x_mult, card.ability.extra.gain } }
    end,
    calculate = function(self, card, context)
        if context.joker_main and card.ability.extra.x_mult > 1 then
            return { xmult = card.ability.extra.x_mult }
        end

        if context.after and not context.blueprint and G.GAME.current_round.hands_played == 0 then
            if SMODS.last_hand_oneshot then
                card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.gain
                return { message = localize("k_upgrade_ex") }
            else
                if card.ability.extra.x_mult > 1 then
                    card.ability.extra.x_mult = 1
                    return {
                        message = localize("k_reset"),
                        colour = G.C.RED
                    }
                end
            end
        end
    end
})
