
local UI = require 'lib/ui/UI'
local Theme = require 'Themes/Theme'

local TurnButton = UI.Object:extend('TurnButton')

function TurnButton:new(x, y, w, h)
    self.button = UI.Button(x,y,w,h, {extensions = {Theme.TurnButton}})
    self.button.text = "Turn"
end
function TurnButton:update(dt)
    self.button:update(dt)
end
function TurnButton:draw()
    self.button:draw()
end
return TurnButton
