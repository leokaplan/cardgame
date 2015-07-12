
local UI = require 'lib/ui/UI'
local Theme = require 'Themes/Theme'
local Deck = require 'UI/Deck'
local StatusBar = require 'UI/StatusBar'
local TurnButton = require 'UI/TurnButton'
local Board = require 'UI/Board'
local UIutils = require 'UI/utils'
local Client = require 'src/Client'

local Game = UI.Object:extend('Game')

function Game:new(x,y,w,h,cell,card,cards)
    local deck = Deck(0,0,card.w,h,cards,card.w,card.h)
    local board = Board(1.5*card.w, card.h,cell.x*cell.w,cell.y*cell.h, cell.x,cell.y)
    local turnbutton = TurnButton(w-card.w, h-card.h,card.w,card.h)
    local status = StatusBar(w/2,h-card.h,card.w,card.h)
    self.frame = UI.Frame(x, y, w, h, {extensions = {Theme.Empty}})
    self.frame:addElement(deck)
    self.frame:addElement(board)
    self.frame:addElement(turnbutton)
    self.frame:addElement(status)
    self.frame:addElement(UIutils.newb(card.w*1.5,h-h/16,card.w,h/16,"Surrender",function() Client.setstate("Start")end))
--    self.frame:addElement(clock)
end
function Game:update(dt)
    self.frame:update(dt)
end
function Game:draw()
    self.frame:draw()
end
return Game
