local manager = {}
local effects = {"lfc", "tbp", "util"}
Wormhole.bg_manager = manager
local conf = Wormhole.config

function manager:draw()
    if G.STAGE ~= G.STAGES.MAIN_MENU then return end
    if not conf.menu then return end
    if not self.chosen then manager:reset() end
    if self.chosen == "util" then
	Wormhole.util_space_manager:draw_background(true)
    elseif self.chosen == "tbp" then
	local shader = G.SHADERS.worm_tbp_space_warp
        local w, h = love.graphics.getDimensions()
	shader:send("time", G.TIMERS.REAL)
	shader:send("transparency", 1)
        love.graphics.setShader(shader)
        love.graphics.rectangle("fill", 0, 0, w, h)
        love.graphics.setShader()
    elseif self.chosen == "lfc" then
	local shader = G.SHADERS.worm_lfc_eigengrau_bg
        local w, h = love.graphics.getDimensions()
	shader:send("time", G.TIMERS.REAL_SHADER)
	shader:send("alpha", 1)
        love.graphics.setShader(shader)
        love.graphics.rectangle("fill", 0, 0, w, h)
        love.graphics.setShader()
    end

end

function manager:reset()
    self.chosen = pseudorandom_element(effects)
end

local game_delete_run = Game.delete_run
function Game:delete_run()
    if G.STAGE ~= G.STAGES.MAIN_MENU then
	manager:reset()
    end
    game_delete_run(self)
end
