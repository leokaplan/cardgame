
local UI = require 'lib/ui/UI'
local Theme = require 'Themes/Theme'
local Game = require 'UI/Game'
local Start = require 'UI/Start'
local Client = require 'src/Client'
local View = UI.Object:extend('View')

function View:new(x,y,w,h,cell,card,cards)
    Client.states.Game = Game(x,y,w,h,cell,card,cards)
    Client.states.Start = Start(x,y,w,h)
end
function View:update(dt)
    Client.states[Client.current]:update(dt)
end
function View:draw()
    Client.states[Client.current]:draw()
end
return View
