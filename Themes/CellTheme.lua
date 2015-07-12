
local Colors = require 'UI/Colors'
    local Game = require 'src/Game'
local Themeutils = require 'Themes/utils'
local Cell = {}
Cell.draw = function(self)
    local piece = Game.getpiece(self.i,self.j)
    love.graphics.setColor(Colors.base64)
    if self.hot then 
        love.graphics.setColor(Colors.base96) 
    end
    if self.down then 
        love.graphics.setColor(Colors.base32) 
    end
    love.graphics.rectangle('fill', self.x, self.y, self.w, self.h)
    
    if piece then
        if self.selected then 
            love.graphics.setColor(Colors.selected) 
            love.graphics.rectangle('line', self.x, self.y, self.w, self.h)
        end
        if piece.owner == Game.getcurrentplayer() then
            love.graphics.setColor(Colors.friend) 
        else
            love.graphics.setColor(Colors.enemy) 
        end
        love.graphics.rectangle('fill', self.x, self.y, self.w, self.h)
        Themeutils.drawimg(Images.piece,self.x,self.y,self.w,self.h)
        love.graphics.setColor(Colors.text) 
        love.graphics.print(piece.life,self.x,self.y)
        love.graphics.printf(piece.cost,self.x,self.y,self.w,"right")

        love.graphics.print(piece.name,self.x,self.y+self.h/4)
        
        love.graphics.print(piece.attack,self.x,self.y+self.h/2)
        love.graphics.printf(piece.defense,self.x,self.y+self.h/2,self.w,"right")
    end
end
Cell.update = function(self,dt)
    local piece = Game.getpiece(self.i,self.j) 
    if self.released then
        if Game.effect then
            Game.selectedeffect(self.i,self.j)
            Game.selecteffect(nil)
            self.selected = false
        end
        if not Game.effect then 
            if piece and piece.owner == Game.getcurrentplayer() and piece.effect then
               Game.selecteffect(piece:effect(),piece.cost) 
            end
        end
    end
end
return Cell
