
local UI = require 'lib/ui/UI'
local Theme = require 'Themes/Theme'
local Cell = UI.Object:extend('Card')

function Cell:new(x, y, w, h,content)
    self.button = UI.Button(x,y,w,h, {extensions = {Theme.Cell}})
    self.button.i, self.button.j = content.i, content.j
end
function Cell:update(dt)
    self.button:update(dt)
end
function Cell:draw()
    self.button:draw()
end
return Cell
