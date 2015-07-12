
local Game = require 'src/Game'
local Colors = require 'UI/Colors'
local Board = {}
Board.overlaydraw = function(self)
     if self.any_selected then
        if self.currently_focused_element then
            local cell = self.elements[self.currently_focused_element]
            --print(cell.i,cell.j)
            local piece = Game.getpiece(cell.i,cell.j)
            if piece then
                if piece.move then
                    local movearea = Game.area(function(i,j) return piece.move.fun(i,j,piece.i,piece.j,piece.move.size)end)
                    for k,v in pairs(movearea) do
                        love.graphics.setColor(Colors.move) 
                        local x = cell.x +(v.i-cell.i)*cell.w
                        local y = cell.y +(v.j-cell.j)*cell.h
                        love.graphics.rectangle('fill', x, y, cell.w, cell.h)
                    end
                end
                if piece.target then
                    local targetarea = Game.area(function(i,j) return piece.target.fun(i,j,piece.i,piece.j,piece.target.size)end)
                    for k,v in pairs(targetarea) do
                        love.graphics.setColor(Colors.target) 
                        local x = cell.x +(v.i-cell.i)*cell.w
                        local y = cell.y +(v.j-cell.j)*cell.h
                        love.graphics.rectangle('fill', x, y, cell.w, cell.h)
                    end
                end
            end
        end
    end
end
return Board
