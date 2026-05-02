-- The Future
SMODS.Joker({
    key = 'riverboat_the_future',
    atlas = 'worm_jokers',
    pos = { x = 1, y = 0 },
    rarity = 'worm_riverboat_cosmic',
    cost = 20,
    blueprint_compat = true,
    discovered = true,
    ppu_artist = { "fooping" },
    ppu_coder = { "fooping" },
    ppu_team = { "riverboat" },
    attributes = { "xmult" , "joker", "hands", "space"},
    config = { extra = { xmult_mod_bought = 0.1, xmult_mod_bought_paired = 0.05, xmult_mod_hands = 0.1, }},
    loc_vars = function(self, info_queue, card)
        local hands = G.GAME and G.GAME.hands_played or 0
        local bought = G.GAME and G.GAME.worm_jokers_bought or 0
        hands = 1 + hands * card.ability.extra.xmult_mod_hands
        local paired = get_pair_status()

        if paired then
            local exponent = 1 + (bought * card.ability.extra.xmult_mod_bought_paired)
            return {
                key = self.key .. '_paired',
                vars = { hands, bought, exponent, card.ability.extra.xmult_mod_hands, card.ability.extra.xmult_mod_bought_paired }
            }
        else
            bought = 1 + bought * card.ability.extra.xmult_mod_bought
        end
        return { vars = { number_format(math.max(1, bought)), card.ability.extra.xmult_mod_bought } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local hands = G.GAME and G.GAME.hands_played or 0
            hands = hands + 1 -- since hands_played doesn't increment fast enough to be calculated
            local bought = G.GAME and G.GAME.worm_jokers_bought or 0
            hands = 1 + hands * card.ability.extra.xmult_mod_hands
            local paired = get_pair_status()
            
            local x_mult = 1
            if paired then
                local exponent = 1 + (bought * card.ability.extra.xmult_mod_bought_paired)
                x_mult = to_big(math.max(1, hands)) ^ exponent
            else
                bought = 1 + bought * card.ability.extra.xmult_mod_bought
                x_mult = bought
            end

            if to_big(x_mult) > to_big(1) then
                return {
                    message = localize({ type = 'variable', key = 'a_xmult', vars = { number_format(x_mult) } }),
                    Xmult_mod = x_mult
                }
            end
        end
    end
})
