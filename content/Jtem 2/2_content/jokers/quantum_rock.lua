SMODS.Gradient({
	key = "jtem2_quantum",
	colours = {
		HEX("000043"),
		HEX("0f1365"),
		HEX("242670"),
		HEX("0f1365"),
	},
	cycle = 1,
})

SMODS.Atlas({
	key = "jtem2_quantum_rock",
	path = "Jtem 2/jokers/quantum_rock.png",
	px = 71,
	py = 95,
})

local gcm = Card.get_chip_mult
function Card:get_chip_mult(context)
	if self.debuff then return 0 end
	if self.ability.effect == "Mult Card" then		--If Enhancements allowed, remove these lines
		self.ability.effect = nil					--
		self.ability.mult = self.ability.mult - 4	--
	end												--
    if self.config.center.key == "j_worm_jtem2_quantum_rock" then return (self.ability.mult or 0) + (self.ability.perma_mult or 0) end --sneaky!
    return gcm(self, context)
end

local gcxm = Card.get_chip_x_mult
function Card:get_chip_x_mult(context)
	if self.debuff then return 0 end
    if self.config.center.key == "j_worm_jtem2_quantum_rock" then return (self.ability.x_mult or 1) + (self.ability.perma_x_mult or 0) end --sneaky!
    return gcxm(self, context)
end

--If Enhancements are allowed, remove this. This removes bonus given from Bonus card enhancement
local gcb = Card.get_chip_bonus
function Card:get_chip_bonus(context)
	if self.debuff then return 0 end
	if self.config.center.key == "j_worm_jtem2_quantum_rock" and self.ability.effect == "Bonus Card" then 
		self.ability.effect = nil
		self.ability.bonus = self.ability.bonus - 30
	end
	return gcb(self, context)
end

--If Enhancements are allowed, remove this. This removes h_x_mult given from Steel card enhancement
local gchxm = Card.get_chip_h_x_mult
function Card:get_chip_h_x_mult(context)
	if self.debuff then return 0 end
	if self.config.center.key == "j_worm_jtem2_quantum_rock" and self.ability.effect == "Steel Card" then 
		self.ability.effect = nil
		self.ability.h_x_mult = self.ability.h_x_mult - 1.5
	end
	return gchxm(self, context)
end

local convert_perma_to_bonus_vars = function(specific_vars) --card.ability has perma bonuses as perma_[bonus] whereas localize_perma_bonuses expects bonus_[bonus]
	local ret = {}
	if specific_vars and specific_vars.perma_x_chips and specific_vars.perma_x_chips ~= 0 then
        ret.bonus_x_chips = specific_vars.perma_x_chips
    end
    if specific_vars and specific_vars.perma_mult and specific_vars.perma_mult ~= 0 then
        ret.bonus_mult = specific_vars.perma_mult
    end
    if specific_vars and specific_vars.perma_x_mult and specific_vars.perma_x_mult ~= 0 then
        ret.bonus_x_mult = specific_vars.perma_x_mult
    end
    if specific_vars and specific_vars.perma_h_chips and specific_vars.perma_h_chips ~= 0 then
        ret.bonus_h_chips = specific_vars.perma_h_chips
    end
    if specific_vars and specific_vars.perma_h_x_chips and specific_vars.perma_h_x_chips ~= 0 then
        ret.bonus_h_x_chips = specific_vars.perma_h_x_chips
    end
    if specific_vars and specific_vars.perma_h_mult and specific_vars.perma_h_mult ~= 0 then
        ret.bonus_h_mult = specific_vars.perma_h_mult
    end
    if specific_vars and specific_vars.perma_h_x_mult and specific_vars.perma_h_x_mult ~= 0 then
        ret.bonus_h_x_mult = specific_vars.perma_h_x_mult
    end
    if specific_vars and specific_vars.perma_p_dollars and specific_vars.perma_p_dollars ~= 0 then
        ret.bonus_p_dollars = specific_vars.perma_p_dollars
    end
    if specific_vars and specific_vars.perma_h_dollars and specific_vars.perma_h_dollars ~= 0 then
        ret.bonus_h_dollars = specific_vars.perma_h_dollars
    end
    if specific_vars and specific_vars.perma_score and specific_vars.perma_score ~= 0 then
        ret.bonus_score = specific_vars.perma_score
    end
    if specific_vars and specific_vars.perma_h_score and specific_vars.perma_h_score ~= 0 then
        ret.bonus_h_score = specific_vars.perma_h_score
    end
    if specific_vars and specific_vars.perma_x_score and specific_vars.perma_x_score ~= 0 then
        ret.bonus_x_score = specific_vars.perma_x_score
    end
    if specific_vars and specific_vars.perma_h_x_score and specific_vars.perma_h_x_score ~= 0 then
        ret.bonus_h_x_score = specific_vars.perma_h_x_score
    end
    if specific_vars and specific_vars.perma_blind_size and specific_vars.perma_blind_size ~= 0 then
        ret.bonus_blind_size = specific_vars.perma_blind_size
    end
    if specific_vars and specific_vars.perma_h_blind_size and specific_vars.perma_h_blind_size ~= 0 then
        ret.bonus_h_blind_size = specific_vars.perma_h_blind_size
    end
    if specific_vars and specific_vars.perma_x_blind_size and specific_vars.perma_x_blind_size ~= 0 then
        ret.bonus_x_blind_size = specific_vars.perma_x_blind_size
    end
    if specific_vars and specific_vars.perma_h_x_blind_size and specific_vars.perma_h_x_blind_size ~= 0 then
        ret.bonus_h_x_blind_size = specific_vars.perma_h_x_blind_size
    end
    if specific_vars and specific_vars.perma_repetitions and specific_vars.perma_repetitions ~= 0 then
        ret.bonus_repetitions = specific_vars.perma_repetitions
    end
	return ret
end

--[[ --If Enhancements are allowed, use this to get the enhancement key from it's effect name
local get_key_from_enhancement = function(name_string) --quick fix
	if name_string == "Bonus Card"		then return "m_bonus" end
	if name_string == "Mult Card"		then return "m_mult" end
	if name_string == "Wild Card"		then return "m_wild" end
	if name_string == "Glass Card"		then return "m_glass" end
	if name_string == "Steel Card"		then return "m_steel" end
	if name_string == "Stone Card"		then return "m_stone" end
	if name_string == "Gold Card"		then return "m_gold" end
	if name_string == "Lucky Card"		then return "m_lucky" end
	if name_string == "Strange Card"	then return "m_worm_jtem2_strange_card" end
	if name_string == "Gravacard"		then return "m_worm_jtem2_gravacard" end
	if name_string == "Neutron Card"	then return "m_worm_jtem2_neutron_card" end
	if name_string == "Stardust Card"	then return "m_worm_riverboat_stardust" end
	if name_string == "Nebulous Card"	then return "m_worm_shrug_nebulous" end
	if name_string == "Junk"			then return "m_worm_junk_card" end
	if name_string == "Frozen Card"		then return "m_worm_ibu_frozen" end
end
]]

--[[ --If Enhancements are allowed, include this for wild cards
function Card:is_suit(suit, bypass_debuff, flush_calc)	-- for SOME reason, redefining Card:is_suit allows the rock to make flushes when wild.
	if flush_calc then									-- I have no idea why, because I can't find any hooks or patches to this in Wormhole or SMODS code.
        if self.ability.effect == 'Stone Card' then		-- Potential causer of bugs if there is one that I didn't see
            return false
        end
        if self.ability.name == "Wild Card" and not self.debuff then
            return true
        end
        if next(find_joker('Smeared Joker')) and (self.base.suit == 'Hearts' or self.base.suit == 'Diamonds') == (suit == 'Hearts' or suit == 'Diamonds') then
            return true
        end
        return self.base.suit == suit
    else
        if self.debuff and not bypass_debuff then return end
        if self.ability.effect == 'Stone Card' then
            return false
        end
        if self.ability.name == "Wild Card" then
            return true
        end
        if next(find_joker('Smeared Joker')) and (self.base.suit == 'Hearts' or self.base.suit == 'Diamonds') == (suit == 'Hearts' or suit == 'Diamonds') then
            return true
        end
        return self.base.suit == suit
    end
end
]]

local function checkShop(self, area)
    if G.GAME.worm_quantum_rock_spawned or area.config.type == "shop" then
	self.set_card_area = nil
	G.GAME.worm_quantum_rock_spawned = true
    end
    return Card.set_card_area(self, area)
end

local rock = SMODS.Joker({
    key = "jtem2_quantum_rock",
    discovered = true,
    unlocked = true,
    ppu_team = { "jtem2" },
    ppu_coder = { "sleepyg11" },
    ppu_artist = { "aikoyori" },

    replace_base_card = true,

    atlas = "worm_jtem2_quantum_rock",
    pos = { x = 0, y = 0 },

    rarity = 3,
    cost = 3,

    config = {
		Xmult = 3,
    },

    attributes = {"xmult", "space"},

    loc_vars = function(self, info_queue, card)
		return {
			set = "Joker",
			type = "descriptions",
			key = "j_worm_jtem2_quantum_rock",
			vars = {
			card.ability.Xmult,
			localize("Jack", "ranks"),
			localize("Spades", "suits_plural"),
			colours = { G.C.SUITS["Spades"] },
			},
		}
    end,

    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)

		full_UI_table.card_type = "Joker"	--when enhanced, card_type changes to "Enhanced". Forcing it to be "Joker" so the UI doesn't break
		full_UI_table.name = nil			--when enhanced, name = true. Forcing it to be nil so "Quantum Rock" gets displayed

		if not card then					--see smods/src/game_object.lua - line 1232 - SMODS.Centers.generate_ui
			card = self:create_fake_card()
		end
		local target = {
			type = 'descriptions',
			key = "j_worm_jtem2_quantum_rock",
			set = "Joker",
			nodes = desc_nodes,
			AUT = full_UI_table,
			vars = specific_vars or {}
		}
		local res = {}
		if self.loc_vars and type(self.loc_vars) == 'function' then
			res = self:loc_vars(info_queue, card) or {}
			target.vars = res.vars or target.vars
			target.key = res.key or target.key
			target.set = res.set or target.set
			target.scale = res.scale
			target.text_colour = res.text_colour
			if desc_nodes == full_UI_table.main then
			full_UI_table.box_starts = res.box_starts
			full_UI_table.box_ends = res.box_ends
			end
		end

		if desc_nodes == full_UI_table.main and not full_UI_table.name then
			full_UI_table.name = localize { type = 'name', set = res.name_set or target.set, key = res.name_key or target.key, nodes = full_UI_table.name, vars = res.name_vars or target.vars or {} } --removed self.set == 'Enhanced' and 'temp_value' or ...
		elseif desc_nodes ~= full_UI_table.main and not desc_nodes.name then
			desc_nodes.name = localize{type = 'name_text', key = res.name_key or target.key, set = res.name_set or target.set }
			if (not full_UI_table.from_detailed_tooltip or full_UI_table.info[1] == desc_nodes) 
			and not full_UI_table.no_styled_name then
			desc_nodes.name_styled = {}

			localize{type = 'name', key = res.name_key or target.key, set = res.name_set or target.set, nodes = desc_nodes.name_styled, fixed_scale = 0.63, no_pop_in = true, no_shadow = true, y_offset = 0, no_spacing = true, no_bump = true, vars = res.name_vars or target.vars} 
			desc_nodes.name_styled = SMODS.info_queue_desc_from_rows(desc_nodes.name_styled, true)
			desc_nodes.name_styled.config.align = "cm"
			end
		end
		if specific_vars and specific_vars.debuffed and not res.replace_debuff then
			target = { type = 'other', key = 'debuffed_' ..
			(specific_vars.playing_card and 'playing_card' or 'default'), nodes = desc_nodes, AUT = full_UI_table, }
		end
		if res.main_start then
			desc_nodes[#desc_nodes + 1] = res.main_start
		end

		localize(target)
		if res.main_end then
			desc_nodes[#desc_nodes + 1] = res.main_end
		end
		desc_nodes.background_colour = res.background_colour

		--ENHANCEMENTS
		--If Enhancements actually worked, include this code to write the enhancement text into the description box
		--[[
		if card.ability.effect then
			local key = get_key_from_enhancement(card.ability.effect)
			local vars = {}
			for i = 1, #G.P_CENTER_POOLS.Enhanced do
				if G.P_CENTER_POOLS.Enhanced[i].key == key then 
					vars = G.P_CENTER_POOLS.Enhanced[i].loc_vars and G.P_CENTER_POOLS.Enhanced[i]:loc_vars(info_queue, card) or G.P_CENTER_POOLS.Enhanced[i].vars or {}
					if #vars == 0 then
						for key, value in pairs(G.P_CENTER_POOLS.Enhanced[i].config) do
							table.insert(vars, value)
						end
					end
				end
			end
			localize{type = "descriptions", set = "Enhanced", key = get_key_from_enhancement(card.ability.effect), nodes = desc_nodes, vars = vars}
		end
		]]

		--PERMA BONUSES
		--[[ --if Enhancements are allowed, include this instead
		if card.ability.perma_bonus and card.ability.perma_bonus ~= 0 or card.ability.effect == "Bonus Card" then
			localize{type = 'other', key = 'card_extra_chips', nodes = desc_nodes, vars = {(card.ability.perma_bonus or 0) + (card.ability.bonus or 0)}}
		end
		]]
		if card.ability.perma_bonus and card.ability.perma_bonus ~= 0 then
			localize{type = 'other', key = 'card_extra_chips', nodes = desc_nodes, vars = {card.ability.perma_bonus}}
		end
		SMODS.localize_perma_bonuses(convert_perma_to_bonus_vars(card.ability), desc_nodes) --see SMODS/src/utils.lua - line 3282

	end,

	calculate = function(self, card, context)
		if context.joker_main or (context.main_scoring and context.cardarea == G.play) then
			return {
			xmult = card.ability.Xmult,
			}
		end
	end,

    add_to_deck = function()
		G.GAME.worm_quantum_rock_spawned = true
	end,
	set_card_type_badge = function(self, card, badges)
		badges[#badges + 1] = create_badge(
			localize('k_worm_jtem2_quantum'),
			SMODS.Gradients.worm_jtem2_quantum,
			G.C.WHITE,
			1.2
		)
		--[[-- If enhancements are allowed, include this for the badge to be generated
		if card.ability.effect then
			local key = get_key_from_enhancement(card.ability.effect)
			local badge_colour = G.C.SECONDARY_SET.Enhanced
			local badge_text_colour = G.C.WHITE
			for i = 1, #G.P_CENTER_POOLS.Enhanced do
				if G.P_CENTER_POOLS.Enhanced[i].key == key then 
					badge_colour = G.P_CENTER_POOLS.Enhanced[i].badge_colour or G.C.SECONDARY_SET.Enhanced
					badge_text_colour = G.P_CENTER_POOLS.Enhanced[i].badge_text_colour or G.C.WHITE
				end
			end
			badges[#badges + 1] = create_badge(
				localize{type = "name_text", set = "Enhanced", key = key},
				badge_colour,
				badge_text_colour,
				1
			)
		end
		]]
	end,
	set_ability = function(self, card, initial, delay_sprites)
		if not G.GAME.worm_quantum_rock_spawned then
			card.set_card_area = checkShop
		end
    end,
})

local function is_rock_present()
	return G.worm_quantum_rock
		and not G.worm_quantum_rock.REMOVED
		and not G.worm_quantum_rock.worm_delay_quantum_rock_remove
		and true
		or false
end
local function is_rock(card)
	return card and (card.worm_was_quantum_rock or (card.config.center and card.config.center.key == rock.key))
end
local function emplace_and_shuffle_in_area(card, area)
	if not area.cards then
		card:remove()
		return
	end
	local new_index = pseudorandom("worm_quantum_rock", 1, #area.cards + 1)
	table.insert(area.cards, new_index, card)
	if card.facing == "back" and area.config.type ~= "discard" and area.config.type ~= "deck" then
		card:flip()
	end

	card:set_card_area(area)
	area:set_ranks()
	area:align_cards()
	card:hard_set_T()
end
local function shuffle_in_area(card, area)
	if not area.cards then
		card:remove()
		return
	end
	for index, _card in ipairs(area.cards) do
		if _card == card then
			table.remove(area.cards, index)
			break
		end
	end
	local new_index = pseudorandom("worm_quantum_rock", 1, #area.cards + 1)
	table.insert(area.cards, new_index, card)
	card:hard_set_T()
end
local function roll_new_rock_target()
	local result
	local annoying_level = G.GAME.worm_quantum_rock_spawned and 0 or 0.97
	if WORM_JTEM.quantum_rock.force_target then
		result = WORM_JTEM.quantum_rock.force_target
	elseif pseudorandom("worm_quantum_rock") < annoying_level then
		result = nil
	else
		local targets = {
			"hand",
			"play",
			"deck",
			"jokers",
			"consumeables",
			"booster_pack",
			"shop_jokers",
			"shop_boosters",
			"shop_vouchers",
			"screenswipe",
		}
		result = pseudorandom_element(targets, "worm_quantum_rock" .. os.time())
	end
	G.worm_quantum_rock_target = result
	return result
end
local function spawn_new_rock(protect, whitelist)
	if is_rock_present() then
		return
	end
	local target = G.worm_quantum_rock_target
	if whitelist and not whitelist[target] then
		roll_new_rock_target()
		return
	end
	local function simple_create(area, real_emplace, with_shop_ui)
		if not area or not area.cards then
			return false
		end
		local card = Card(area.T.x + area.T.w / 2 - G.CARD_W / 2, area.T.y, G.CARD_W, G.CARD_H, G.P_CARDS["S_J"], rock)
		--card.ability = G.GAME.worm_jtem_rock_persist_ability or card.ability
		if real_emplace == true then
			area:emplace(card)
			shuffle_in_area(card, area)
		elseif real_emplace == 2 then
			area:emplace(card)
		else
			emplace_and_shuffle_in_area(card, area)
		end
		roll_new_rock_target()
		if protect then
			card.worm_protect_quantum_rock = true
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.25,
				timer = "REAL",
				blocking = false,
				blockable = false,
				func = function()
					card.worm_protect_quantum_rock = nil
					return true
				end,
			}))
		end
		if with_shop_ui then
			create_shop_card_ui(card)
		end
		return true
	end
	if target == "hand" and G.hand and G.STATE == G.STATES.SELECTING_HAND and G.hand.cards[1] then
		simple_create(G.hand, true)
	elseif target == "play" and G.play and G.STATE == G.STATES.HAND_PLAYED then
		simple_create(G.play)
	elseif target == "jokers" and G.jokers and G.OVERLAY_MENU then
		simple_create(G.jokers)
	elseif target == "consumeables" and G.consumeables and G.OVERLAY_MENU then
		simple_create(G.consumeables)
	elseif target == "booster_pack" and G.pack_cards then
		simple_create(G.pack_cards)
	elseif target == "shop_jokers" and G.shop_jokers then
		simple_create(G.shop_jokers, nil, true)
	elseif target == "shop_boosters" and G.shop_booster then
		simple_create(G.shop_booster, nil, true)
	elseif target == "shop_vouchers" and G.shop_vouchers then
		if simple_create(G.shop_vouchers, true, true) and G.shop_vouchers.cards then
			G.shop_vouchers.config.card_limit = #G.shop_vouchers.cards
		end
	end
end
local function destroy_rock(delay, no_replace, whitelist)
	local card = G.worm_quantum_rock
	if card then
		card.states.visible = false
		--G.GAME.worm_jtem_rock_persist_ability = card.ability
		if delay then
			card.worm_delay_quantum_rock_remove = true
			G.E_MANAGER:add_event(Event({
				blocking = false,
				func = function()
					card.worm_keep_quantum_rock_target = true
					card:remove()
					return true
				end,
			}))
		else
			card.worm_keep_quantum_rock_target = true
			card:remove()
		end
	end
	if not no_replace then
		spawn_new_rock(whitelist)
	end
	roll_new_rock_target()
end

--

local old_showman = SMODS.showman
function SMODS.showman(card_key, ...)
	if card_key == rock.key then
		return false
	end
	return old_showman(card_key, ...)
end

local old_game_update = Game.update
function Game:update(...)
	old_game_update(self, ...)
	if G.GAME then
		if G.GAME.used_jokers then
			G.GAME.used_jokers[rock.key] = nil
		end
		if G.GAME.worm_quantum_rock_spawned then
			G.worm_quantum_rock_target_dt = G.worm_quantum_rock_target_dt or G.TIMERS.REAL
			if G.TIMERS.REAL - G.worm_quantum_rock_target_dt > 0.5 then
				roll_new_rock_target()
				G.worm_quantum_rock_target_dt = G.TIMERS.REAL
			end
			if G.worm_quantum_rock then
				if G.worm_quantum_rock.REMOVED and G.worm_quantum_rock.area then
					G.worm_quantum_rock:remove()
					G.worm_quantum_rock = nil
				end
			end
		else
			G.worm_quantum_rock_target = nil
		end
	else
		G.worm_quantum_rock_target = nil
	end
end

local old_card_update = Card.update
function Card:update(...)
	local should_remove_rock = false
	if is_rock(self) then
		self.worm_was_quantum_rock = true
		if self.area == G.play and G.STATE ~= G.STATES.HAND_PLAYED then
			G.play:remove_card(self)
			G.discard:emplace(self)
		end
		if not self.REMOVED and not self.worm_delay_quantum_rock_remove then
			if not is_rock_present() then
				G.worm_quantum_rock = self
			end
			if not self.worm_protect_quantum_rock then
				if
					G.worm_quantum_rock ~= self
					or not self.states.visible
					or (not self.worm_protect_quantum_rock_area and (self.area == G.deck))
					or (
						not self.worm_protect_quantum_rock_boundaries
						and (
							(self.VT.w <= 0 or self.VT.h <= 0)
							or (self.VT.x + self.VT.w < 0)
							or (self.VT.y + self.VT.h < 0)
							or (self.VT.x > G.ROOM.T.x + G.ROOM.T.w + 1)
							or (self.VT.y > G.ROOM.T.y + G.ROOM.T.h + 1)
						)
					)
				then
					should_remove_rock = true
				end
			end
		end
		if self.REMOVED and self.area then
			self:remove()
		end
	end
	old_card_update(self, ...)
	if should_remove_rock then
		destroy_rock(true)
	end
end

local old_load = Card.load
function Card:load(...)
	old_load(self, ...)
	if is_rock(self) then
		destroy_rock(true)
	end
end

local old_overlay_menu = G.FUNCS.overlay_menu
function G.FUNCS.overlay_menu(...)
	local is_replace = G.OVERLAY_MENU
	local r = old_overlay_menu(...)
	if not is_replace then
		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.25,
			timer = "REAL",
			pause_force = true,
			blocking = false,
			blockable = false,
			func = function()
				if G.OVERLAY_MENU then
					if is_rock_present() then
						function crawl(e)
							local parent = e.UIBox or e.parent
							while parent do
								e = parent
								parent = e.UIBox or e.parent
							end
							return e
						end

						local parent = crawl(G.worm_quantum_rock)
						if parent ~= G.OVERLAY_MENU then
							destroy_rock(true)
						end
					else
						spawn_new_rock()
					end
				end
				return true
			end,
		}))
	end
	return r
end

local old_card_init = Card.init
function Card:init(...)
	local r = old_card_init(self, ...)
	if is_rock(self) then
		if not is_rock_present() then
			G.worm_quantum_rock = self
		end
		if G.worm_force_replace_quantum_rock then
			if is_rock_present() and G.worm_quantum_rock ~= self then
				destroy_rock()
			end
			G.worm_quantum_rock = self
		else
			if G.worm_quantum_rock ~= self and not (self.area and self.area.config.collection) then
				destroy_rock(true)
			end
		end
	end
	return r
end

local wipe_on_ref = G.FUNCS.wipe_on
function G.FUNCS.wipe_on(...)
	local r = wipe_on_ref(...)
	if G.screenwipecard then
		if G.worm_quantum_rock_target == "screenswipe" then
			G.screenwipecard.children.front.states.visible = false
			G.screenwipecard.children.center.atlas = SMODS.get_atlas(rock.atlas)
			G.screenwipecard.children.center:set_sprite_pos(rock.pos)
		end
	end
	return r
end

local old_end_consumeable = G.FUNCS.end_consumeable
function G.FUNCS.end_consumeable(...)
	spawn_new_rock(true, {
		shop_jokers = true,
		shop_boosters = true,
		shop_vouchers = true,
	})
	return old_end_consumeable(...)
end

--

local function calculate_rock(context)
	local target = G.worm_quantum_rock_target or roll_new_rock_target()
	local is_present = is_rock_present()
	if target == "hand" then
	    if
		context.stay_flipped
		and (G.STATE == G.STATES.DRAW_TO_HAND or (SMODS.OPENED_BOOSTER and SMODS.OPENED_BOOSTER.config.center.draw_hand))
		and not is_present
		then
		    G.E_MANAGER:add_event(Event({
			func = function()
			    if is_rock_present() then
				return true
			    end
			    local _area = G.deck
			    local card = Card(_area.T.x, _area.T.y, G.CARD_W, G.CARD_H, G.P_CARDS["S_J"], rock)
			    G.worm_quantum_rock = card
			    card.facing = "back"
			    card.sprite_facing = "back"
			    card.worm_protect_quantum_rock = true
			    roll_new_rock_target()
			    G.E_MANAGER:add_event(Event({
				func = function()
				    -- Sanity check
				    if not G.hand.cards[1] then
					card:remove()
					return true
				    end
				    G.hand:emplace(card)
				    shuffle_in_area(card, G.hand)
				    G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.25,
					timer = "REAL",
					blocking = false,
					blockable = false,
					func = function()
					    card.worm_protect_quantum_rock = nil
					    return true
					end,
				    }))
				    return true
				end,
			    }))
			    return true
			end,
		    }))
		    return true
		end
	elseif target == "deck" then
		if context.worm_opening_deck then
			G.worm_force_replace_quantum_rock = true
			local _area = pseudorandom_element(context.areas, "worm_quantum_rock" .. os.time())
			local card = Card(_area.T.x, _area.T.y, G.CARD_W * 0.7, G.CARD_H * 0.7, nil, rock)
			G.worm_force_replace_quantum_rock = nil
			G.worm_quantum_rock = card
			card.worm_protect_quantum_rock_boundaries = true
			emplace_and_shuffle_in_area(card, _area)
			roll_new_rock_target()
		end
	elseif target == "booster_pack" then
		if context.open_booster and not is_present then
			G.E_MANAGER:add_event(Event({
				blocking = false,
				blockable = false,
				func = function()
					if not G.GAME.PACK_INTERRUPT then
						return true
					end
					if G.pack_cards then
						G.E_MANAGER:add_event(Event({
							blocking = false,
							func = function()
								local _area = G.pack_cards
								local card = Card(_area.T.x, _area.T.y, G.CARD_W, G.CARD_H, G.P_CARDS["S_J"], rock)
								G.worm_quantum_rock = card
								emplace_and_shuffle_in_area(card, _area)
								card:start_materialize()
								roll_new_rock_target()
								return true
							end,
						}))
						return true
					end
				end,
			}))
		end
	elseif target == "shop_jokers" or target == "shop_vouchers" or target == "shop_boosters" then
		if context.starting_shop and not is_present then
			spawn_new_rock()
		end
	end
end

WORM_JTEM.quantum_rock = {
	enabled = Wormhole.config.quantum_rock,
	center = rock,
	calculate = calculate_rock,
}
