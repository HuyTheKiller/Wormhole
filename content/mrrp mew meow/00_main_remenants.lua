Card.is_3 = Card.is_3 or function(self, bypass_debuff)
    if self.debuff and not bypass_debuff then
        return false
    elseif self:get_id() == 3 then
        return 1
    end
end

Wormhole.mrrp_signed = function(val, invert, signlesszero)
    local sign = ""
    if not val then
        return
    end
    if val > 0 then
        sign = invert and "-" or "+"
    elseif val < 0 then
        sign = invert and "+" or "-"
    elseif val == 0 and not signlesszero then
        sign = invert and "-" or "+"
    end
    return sign .. math.abs(val)
end

SMODS.Atlas {
    key = "mrrp",
    path = "mrrp mew meow/mrrp-cards.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "mrrp_stake",
    path = "mrrp mew meow/mrrp-stakes.png",
    px = 29,
    py = 29
}
