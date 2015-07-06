

local Game = require 'src/Game'
local Statusbar = {}
Statusbar.draw = function(self)
    love.graphics.setColor(64, 64, 64)
    love.graphics.rectangle('fill', self.x, self.y, self.w, self.h)
    love.graphics.setColor(0, 0, 0) 
    love.graphics.print("current player: "..Game.getcurrentplayer(),self.x,self.y)
    local players = Game.getplayers()
    for k,v in pairs(players) do
        love.graphics.print(k.." : "..v.mana,self.x,self.y+12*k)
    end
end
Statusbar.update = function(self)
end
return Statusbar
