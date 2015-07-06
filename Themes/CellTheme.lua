
    local Game = require 'src/Game'
local Cell = {}
Cell.draw = function(self)
    local piece = Game.getpiece(self.i,self.j)
    love.graphics.setColor(64, 64, 64)
    if self.hot then 
        love.graphics.setColor(96, 96, 96) 
    end
    if self.down then 
        love.graphics.setColor(32, 32, 32) 
    end
    love.graphics.rectangle('fill', self.x, self.y, self.w, self.h)
    
    if piece then
        if self.selected then 
            love.graphics.setColor(128, 128, 32) 
            love.graphics.rectangle('line', self.x, self.y, self.w, self.h)
        end
        if piece.owner == Game.getcurrentplayer() then
            love.graphics.setColor(0, 128, 0,100) 
        else
            love.graphics.setColor(128, 0, 0,100) 
        end
        love.graphics.rectangle('fill', self.x, self.y, self.w, self.h)
        love.graphics.setColor(0, 0, 0) 
        love.graphics.print(piece.life,self.x,self.y)
--        love.graphics.print(piece.owner,self.x+self.w-12,self.y)
        love.graphics.print(piece.cost,self.x+self.w-12,self.y)
        love.graphics.print(piece.attack,self.x,self.y+self.h-12)
        love.graphics.print(piece.defense,self.x+self.w/2,self.y+self.h-12)
    end
end
Cell.update = function(self,dt)
    local piece = Game.getpiece(self.i,self.j) 
    if self.released then
        if Game.effect then
            Game.selectedeffect(self.i,self.j)
            Game.selecteffect(nil)
            self.selected = false
        else
            if piece and piece.owner == Game.getcurrentplayer() then
               Game.selecteffect(piece.effect(piece),piece.cost) 
            end
        end
    end
end
return Cell
