SMODS.Joker {
    key = "cking",
    atlas = 'VVjokers',
    rarity = 2,
    cost = 4,
    pos = { x = 2, y = 1 },
    soul_pos = { x = 3, y = 1 },
    config = {
        extra = {
        },
        immutable = {
            rounds = 3,
            roundup = 0,
            roundadd = 1
        }
    },
    ppu_team = { "Violent Violets" },
    ppu_artist = { "FirstTry" },
    ppu_coder = { "FirstTry" },
    attributes = { "hand_type", "space", "level_up" },
    loc_vars = function(self, info_queue, card)
        local _handname, _played = 'High Card', -1
        for hand_key, hand in pairs(G.GAME.hands) do
            if hand.played > _played and SMODS.is_poker_hand_visible(hand_key) then
                _played = hand.played
                _handname = hand_key
            end
        end
        local most_played = _handname
        return {
            vars = {
                card.ability.immutable.rounds,
                card.ability.immutable.roundup,
                most_played
            }
        }
    end,
    calculate = function(self, card, context)
        local round_tally = 0
        local _handname, _played = 'High Card', -1
        for hand_key, hand in pairs(G.GAME.hands) do
            if hand.played > _played and SMODS.is_poker_hand_visible(hand_key) then
                _played = hand.played
                _handname = hand_key
            end
        end
        local most_played = _handname
        if context.end_of_round and context.main_eval then
            card.ability.immutable.roundup = card.ability.immutable.roundup + card.ability.immutable.roundadd
            SMODS.calculate_effect({ message = card.ability.immutable.roundup .. "/" .. card.ability.immutable.rounds, colour = G.C.RED}, card)
            if (card.ability.immutable.roundup >= card.ability.immutable.rounds) then
                SMODS.upgrade_poker_hands {
                    from = card,
                    parameters = { "chips", "mult" },
                    level_up = 1,
                    hands = most_played
                }
                card.ability.immutable.roundup = 0
            end
        end
    end
}
