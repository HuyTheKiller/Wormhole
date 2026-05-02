local manager = {}
local effects = {"lfc", "tbp", "util"}
Wormhole.bg_manager = manager
local conf = Wormhole.config
local target_height = 720

function manager:draw()
    if G.STAGE ~= G.STAGES.MAIN_MENU then return end
    if not conf.menu then return end
    if not self.chosen then manager:reset() end
    local w, h = love.graphics.getDimensions()

    if self.chosen == "util" then
	Wormhole.util_space_manager:draw_background(true)
    elseif self.chosen == "tbp" then
        if not self.tbp_canvas then
            self.canvas_scale = h / target_height
            self.canvas_w = math.ceil(w / self.canvas_scale)
            self.canvas_h = target_height
            self.tbp_canvas = love.graphics.newCanvas(self.canvas_w, self.canvas_h)
        end

	local shader = G.SHADERS.worm_tbp_space_warp
        love.graphics.push("all")
        love.graphics.setCanvas(self.tbp_canvas)
        love.graphics.clear()
	shader:send("time", G.TIMERS.REAL)
	shader:send("transparency", 1)
        love.graphics.setShader(shader)
        love.graphics.rectangle("fill", 0, 0, self.canvas_w, self.canvas_h)
        love.graphics.setCanvas()
        love.graphics.pop()
        love.graphics.draw(self.tbp_canvas, 0, 0, 0, self.canvas_scale, self.canvas_scale)
    elseif self.chosen == "lfc" then
	local shader = G.SHADERS.worm_lfc_eigengrau_bg
	shader:send("time", G.TIMERS.REAL_SHADER)
	shader:send("alpha", 1)
        love.graphics.setShader(shader)
        love.graphics.rectangle("fill", 0, 0, w, h)
        love.graphics.setShader()
    end

    if self.splash_args then
        if not self.splash_args.mid_flash or self.splash_args.mid_flash == 0 then
            self.splash_args = nil
        else
            local opacity = self.splash_args.mid_flash / 1.6
            love.graphics.setColor({1, 1, 1, opacity})

            love.graphics.rectangle("fill", 0, 0, w, h)
            love.graphics.setColor(G.C.WHITE)
        end
    end
end

function manager:reset()
    if self.chosen == "util" then
        Wormhole.util_space_manager:reset()
    end
    self.chosen = pseudorandom_element(effects)
end

local game_delete_run = Game.delete_run
function Game:delete_run()
    if G.STAGE ~= G.STAGES.MAIN_MENU then
        manager:reset()
    end
    game_delete_run(self)
end

local love_resize_ref = love.resize
function love.resize(w, h)
    if love_resize_ref then love_resize_ref(w, h) end
    if manager.tbp_canvas then
        manager.canvas_scale = h / target_height
        manager.canvas_w = math.ceil(w / manager.canvas_scale)
        manager.canvas_h = target_height
        manager.tbp_canvas = love.graphics.newCanvas(manager.canvas_w, manager.canvas_h)
    end
end
