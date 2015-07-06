
local Game = require 'src/Game'
local Board = {}
Board.overlaydraw = function(self)
    if not f2 then print("a") f2= true end
     if self.any_selected then
        if self.currently_focused_element then
            local cell = self.elements[self.currently_focused_element]
            --print(cell.i,cell.j)
            local piece = Game.getpiece(cell.i,cell.j)
            if piece then
                local movearea = Game.area(function(i,j) return piece.move.fun(i,j,piece.i,piece.j,piece.move.size)end)
                local targetarea = Game.area(function(i,j) return piece.target.fun(i,j,piece.i,piece.j,piece.target.size)end)
                for k,v in pairs(movearea) do
                    love.graphics.setColor(10,10,128,50) 
                    local x = cell.x +(v.i-cell.i)*cell.w
                    local y = cell.y +(v.j-cell.j)*cell.h
                    love.graphics.rectangle('fill', x, y, cell.w, cell.h)
                end
                for k,v in pairs(targetarea) do
                    love.graphics.setColor(128, 10, 10,50) 
                    local x = cell.x +(v.i-cell.i)*cell.w
                    local y = cell.y +(v.j-cell.j)*cell.h
                    love.graphics.rectangle('fill', x, y, cell.w, cell.h)
                end
            end
        end
    end
end
return Board
