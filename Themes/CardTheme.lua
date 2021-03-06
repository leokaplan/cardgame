
local Game = require 'src/Game'
local Colors = require 'UI/Colors'
local Card = {}
Card.draw = function(self)
    love.graphics.setColor(Colors.base64)
    if self.hot then love.graphics.setColor(Colors.base96) end
    if self.down then love.graphics.setColor(Colors.base32) end
    love.graphics.rectangle('fill', self.x, self.y, self.w, self.h)
    if self.selected then 
        love.graphics.setColor(Colors.selected) 
        love.graphics.rectangle('line', self.x, self.y, self.w, self.h)
    end
    love.graphics.setColor(Colors.text) 
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
