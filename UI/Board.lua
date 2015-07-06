
local UI = require 'lib/ui/UI'
local Theme = require 'Themes/Theme'
local Cell = require 'UI/Cell'
local Board = UI.Object:extend('Board')

function Board:new(x, y, w, h,cellx,celly)
    self.spacing = 1
    self.margin = 1
    self.cellx,self.celly = cellx,celly
    self.cellw = math.floor(w/cellx)
    self.cellh = math.floor(h/celly)
    self.frame = UI.Frame(x, y, w+self.spacing*cellx, h+self.spacing*celly, {extensions = {Theme.Board},  auto_spacing = self.spacing, auto_margin = self.margin})
    for i = 1, self.cellx do
        for j=1,self.celly do
            self.frame:addElement(Cell((i-1)*(self.cellw+self.spacing),(j-1)*(self.cellh+self.spacing),self.cellw,self.cellh,{i = i ,j = j}).button)
        end
    end
end
function Board:update(dt)
    self.frame:update(dt)
end
function Board:draw()
    self.frame:draw()
end
return Board
