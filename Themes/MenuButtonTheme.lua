

local Game = require 'src/Game'
local Card = {}
Card.draw = function(self)
    love.graphics.setColor(Colors.base64)
    if self.hot then love.graphics.setColor(Colors.base96) end
    if self.down then love.graphics.setColor(Colors.base32) end
    love.graphics.rectangle('fill', self.x, self.y, self.w, self.h)
    love.graphics.setColor(Colors.text) 
    if self.text then
        love.graphics.print(self.text,self.x+self.w/4,self.y+self.h/2)
    end
end
Card.update = function(self)
    if self.released then
        if self.func then 
            self.func()
        end
    end
end
return Card
