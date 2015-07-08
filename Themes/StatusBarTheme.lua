

local Game = require 'src/Game'
local Statusbar = {}
Statusbar.draw = function(self)
    love.graphics.setColor(64, 64, 64)
    love.graphics.rectangle('fill', self.x, self.y, self.w, self.h)
    local cursor = self.y
    love.graphics.setColor(0,0,0)
    love.graphics.print("time to turn:",self.x,cursor)
    love.graphics.setColor(255, 255, 255) 
    love.graphics.print(Game.timetoturn,self.x+self.w/2,cursor)
    cursor = cursor + 12
    local players = Game.getplayers()
    for k,v in pairs(players) do
        love.graphics.setColor(0,0,0)
        love.graphics.print(k.." :",self.x,cursor)
        local player = Game.getcurrentplayer()
        if player == k then
            love.graphics.setColor(0, 255,0) 
        else
            love.graphics.setColor(255, 0, 0) 
        end
        love.graphics.print(v.mana,self.x+self.w/2,cursor)
        cursor = cursor + 12
    end
end
Statusbar.update = function(self)
end
return Statusbar
