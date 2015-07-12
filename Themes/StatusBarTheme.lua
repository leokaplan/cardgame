

local Game = require 'src/Game'
local Colors = require 'UI/Colors'
local Statusbar = {}
Statusbar.draw = function(self)
    love.graphics.setColor(Colors.base64)
    love.graphics.rectangle('fill', self.x, self.y, self.w, self.h)
    local cursor,cursorstep = self.y,20
    love.graphics.setColor(Colors.text)
    love.graphics.print("time to turn:",self.x,cursor)
    love.graphics.setColor(Colors.neutraltext) 
    love.graphics.print(Game.timetoturn,self.x+self.w/2,cursor)
    cursor = cursor + cursorstep
    local players = Game.getplayers()
    for k,v in pairs(players) do
        love.graphics.setColor(Colors.text)
        love.graphics.print(k.." :",self.x,cursor)
        local player = Game.getcurrentplayer()
        if player == k then
            love.graphics.setColor(Colors.friendtext) 
        else
            love.graphics.setColor(Colors.enemytext) 
        end
        love.graphics.print(v.mana,self.x+self.w/2,cursor)
        cursor = cursor + cursorstep
    end
end
Statusbar.update = function(self)
end
return Statusbar
