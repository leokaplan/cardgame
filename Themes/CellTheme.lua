
local Game = require 'src/Game'
local Cell = {}
Cell.draw = function(self)
    local piece = Game.getpiece(self.i,self.j)
    love.graphics.setColor(64, 64, 64)
    if self.hot then 
        love.graphics.setColor(96, 96, 96) 
        if piece then
            --a = piece.getmovarea
            --for i in a do
            --  target = getpiece(i)
            --  if target then
            --      red
            --  else
            --      blue
            --  end
            --  rect(i)
            --end
        end
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
        love.graphics.setColor(0, 0, 0) 
        love.graphics.print(piece.life,self.x+self.w/2,self.y)
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
        else
            if piece then
               Game.selecteffect(piece.effect(piece)) 
            end
        end
    end
end
return Cell
