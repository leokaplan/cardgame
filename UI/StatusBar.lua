
local UI = require 'lib/ui/UI'
local Theme = require 'Themes/Theme'
local Statusbar = UI.Object:extend('Statusbar')

function Statusbar:new(x, y, w, h)
    self.frame = UI.Frame(x,y,w,h, {extensions = {Theme.StatusBar}})
end
function Statusbar:update(dt)
    self.frame:update(dt)
end
function Statusbar:draw()
    self.frame:draw()
end
return Statusbar
