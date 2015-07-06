local Game = require 'src/Game'
local TurnButton = {}
TurnButton.draw = function(self)
    love.graphics.setColor(64, 64, 64)
    if self.hot then love.graphics.setColor(96, 96, 96) end
    if self.down then love.graphics.setColor(32, 32, 32) end
    love.graphics.rectangle('fill', self.x, self.y, self.w, self.h)
    if self.selected then 
        love.graphics.setColor(128, 128, 32) 
        love.graphics.rectangle('line', self.x, self.y, self.w, self.h)
    end
    if self.text then
        love.graphics.setColor(0, 0, 0) 
        love.graphics.print(self.text,self.x+self.w/2,self.y+self.h/2)
    end
end
TurnButton.update = function(self,dt)
    if self.released then
        Game.turn()
    end
end
return TurnButton
