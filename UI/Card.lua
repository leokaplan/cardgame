local UI = require 'lib/ui/UI'
local Theme = require 'Themes/Theme'
local Card = UI.Object:extend('Card')

function Card:new(x, y, w, h,content)
    self.button = UI.Button(x,y,w,h, {extensions = {Theme.Card}})
    self.button.name = content.name
    self.button.desc = content.desc
    self.button.effect = content.effect
    self.button.cost = content.cost
end
function Card:update(dt)
    self.button:update(dt)
end
function Card:draw()
    self.button:draw()
end
return Card
