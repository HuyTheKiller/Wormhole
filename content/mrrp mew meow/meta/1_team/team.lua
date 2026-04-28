PotatoPatchUtils.Team {
    name = 'Mrrp Mew Meow :3',
    colour = G.C.mrrp_pink,
    loc = true,
    credit_rows = {3,3},
    short_credit = true,
    calculate = function(self,context)
        -- global detection for TOPTHBCBC:S
        if context.starting_shop then
            G.GAME.mrrp_capitalism_active = true
        end
        if context.reroll_shop then
            G.GAME.mrrp_capitalism_active = false
        end
    end,
}