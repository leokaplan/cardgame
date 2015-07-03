
local UI = require 'lib/ui/UI'
local Theme = require 'Themes/Theme'
local Deck = require 'UI/Deck'
local TurnButton = require 'UI/TurnButton'
local Board = require 'UI/Board'

local View = UI.Object:extend('View')

function View:new(x,y,w,h,cell,card,cards)
    local deck = Deck(0,0,card.w,h,cards,card.w,card.h)
    local board = Board(1.5*card.w, card.h,cell.x*cell.w,cell.y*cell.h, cell.x,cell.y)
    local turnbutton = TurnButton(w-card.w, h-card.h,card.w,card.h)
    
    self.frame = UI.Frame(x, y, w, h, {extensions = {Theme.Board}})
    self.frame:addElement(deck)
    self.frame:addElement(board)
    self.frame:addElement(turnbutton)
end
function View:update(dt)
    self.frame:update(dt)
end
function View:draw()
    self.frame:draw()
end
return View
