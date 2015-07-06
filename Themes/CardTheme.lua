
local Game = require 'src/Game'
local Card = {}
Card.draw = function(self)
    love.graphics.setColor(64, 64, 64)
    if self.hot then love.graphics.setColor(96, 96, 96) end
    if self.down then love.graphics.setColor(32, 32, 32) end
    love.graphics.rectangle('fill', self.x, self.y, self.w, self.h)
    if self.selected then 
        love.graphics.setColor(128, 32, 32) 
        love.graphics.rectangle('line', self.x, self.y, self.w, self.h)
    end
    love.graphics.setColor(0, 0, 0) 
    love.graphics.print(self.name,self.x,self.y)
    love.graphics.print(self.cost,self.w-10,self.y)
    love.graphics.printf(self.desc,self.x,self.y+12*2,self.w )
end
Card.update = function(self)
    if self.selected then
        Game.selecteffect(self.effect,self.cost)
    end
end
return Card
