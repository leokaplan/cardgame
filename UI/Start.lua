
local UI = require 'lib/ui/UI'
local Theme = require 'Themes/Theme'
local Client = require 'src/Client'
local Start = UI.Object:extend('Start')
function Start:new(x,y,w,h,cell,card,cards)
    self.frame = UI.Frame(x, y, w, h, {extensions = {Theme.Empty}})
    self.frame:addElement(Client.newb(w/4,h/2,w/2,h/8,"Start",function() Client.setstate("Game")end))
    self.frame:addElement(Client.newb(w/4,h/2+h/7,w/2,h/8,"Config",function() Client.setstate("Config")end))
    self.frame:addElement(Client.newb(w/4,h/2+h/3,w/2,h/8,"Exit",function() love.event.quit() end))
end
function Start:update(dt)
    self.frame:update(dt)
end
function Start:draw()
    self.frame:draw()
end
return Start
