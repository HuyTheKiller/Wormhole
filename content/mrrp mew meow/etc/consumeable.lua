SMODS.Consumable {
    ppu_team = {'Mrrp Mew Meow :3'},
    ppu_artist = {'Cyan'},
    ppu_coder = {'Minty'},
    key = "mrrp_reentry",
    set = "Tarot",
    atlas = "mrrp",
    pos = {
        x = 1,
        y = 1
    },
    config = {
        extra = {
            dollars = 3
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                SMODS.signed_dollars(card.ability.extra.dollars)
            }
        }
    end,
    cost = 3,
    can_use = function(self, card)
        for i, v in ipairs(G.hand.highlighted) do
            if v.config.center.key ~= "c_base"
                or v.edition
                or v.seal
            then
                return true
            end
        end
        return false
    end,
    use = function(self, card, area, copier)
        local mods = 0

        for i, v in ipairs(G.hand.highlighted) do
            local percent = 1.15 - (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event {
                func = function()
                    v:flip()
                    play_sound('card1', percent)
                    return true
                end, delay = 0.15, trigger = "after"
            })
        end

        for i, v in ipairs(G.hand.highlighted) do
            if v.config.center.key ~= "c_base" then
                G.E_MANAGER:add_event(Event {
                    func = function()
                        v:set_ability("c_base")
                        return true
                    end
                })
                mods = mods + 1
            end
            if v.edition then
                G.E_MANAGER:add_event(Event {
                    func = function()
                        v:set_edition(nil, nil, true)
                        return true
                    end
                })
                mods = mods + 1
            end
            if v.seal then
                G.E_MANAGER:add_event(Event {
                    func = function()
                        v:set_seal(nil, true)
                        return true
                    end
                })
                mods = mods + 1
            end
        end

        -- All of this is from VanillaRemade's Black Hole card by nh6574
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
            { handname = localize('k_random_hands'), chips = '...', mult = '...', level = '' })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = true
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = nil
                return true
            end
        }))
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+' })
        delay(1.3)
        -- end of referenced code

        for i = 1, mods do
            local _,hand = pseudorandom_element(G.GAME.hands, pseudoseed("reentry" .. i))
            local j = 0
            while not SMODS.is_poker_hand_visible(hand) do
                j = j + 1
                _,hand = pseudorandom_element(G.GAME.hands, pseudoseed("reentry" .. i .. j))
            end
            SMODS.upgrade_poker_hands({
                hands = hand,
                from = card,
                instant = true,
            })
        end

        update_hand_text({ sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },
            { mult = 0, chips = 0, handname = '', level = '' })

        for i, v in ipairs(G.hand.highlighted) do
            local percent = 0.85 + ( i - 0.999 ) / ( #G.hand.highlighted - 0.998 ) * 0.3
            G.E_MANAGER:add_event(Event {
                func = function()
                    v:flip()
                    play_sound('tarot2', percent, 0.6)
                    return true
                end, delay = 0.15, trigger = "after"
            })
        end

        G.E_MANAGER:add_event(Event {
            func = function()
                G.hand:unhighlight_all()
                return true
            end, delay = 0.5, trigger = "after"
        })
    end
}
