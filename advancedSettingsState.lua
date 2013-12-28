AdvancedSettingsState = {}
AdvancedSettingsState.__index = AdvancedSettingsState
setmetatable(AdvancedSettingsState, State)

function AdvancedSettingsState.create(parent, rules)
	local self = setmetatable(State.create(), AdvancedSettingsState)

	self.inputs = parent.inputs
	self.cursors = parent.cursors
	self.rules = rules

	self.bottomMenu = self:addComponent(Menu.create(0, 0, 0, 0, 0, self))
	self.bottomMenu:addButton("DEFAULTS", "defaults", 50, 385, 250, 32)
	self.bottomMenu:addButton("BACK", "back", 400, 385, 250, 32)

	local times = {"0:30", "1:00", "1:30", "2:00", "2:30", "3:00"}
	self.slider = self:addComponent(Slider.create(400, 70, 250, times, 2, self))

	self.bg = ResMgr.getImage("bg_stars.png")

	return self
end

function AdvancedSettingsState:draw()
	love.graphics.draw(self.bg, 0, 0)

	love.graphics.setFont(ResMgr.getFont("menu"))
	love.graphics.printf("ADVANCED SETTINGS", 0, 25, WIDTH, "center")

	self.bottomMenu:draw()
	self.slider:draw()
end

function AdvancedSettingsState:buttonPressed(id, source)
	if id == "defaults" then

	elseif id == "back" then
		popState()
	end
end
