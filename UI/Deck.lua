local UI = require 'lib/ui/UI'
local Theme = require 'Themes/Theme'
local Card = require 'UI/Card'
local Deck = UI.Object:extend('Deck')

function Deck:new(x, y, w, h, cards, cardw,cardh)
    self.spacing = 5
    self.margin = 5
    local hsize = #cards > 7 and #cards or 7
    self.frame = UI.Scrollarea(0, 0, w+2*self.spacing, hsize*cardh, {extensions = {Theme.Deck}, auto_align = true, auto_spacing = self.spacing, auto_margin = self.margin, show_scrollbars = true, area_width = w, area_height = h})
    self.cards = {}
    for i = 1, #cards do
        self.cards[i] = Card(0,i*cardh,cardw-2*self.spacing,cardh,cards[i])
        self.frame:addElement(self.cards[i].button)
    end
end
function Deck:update(dt)
    self.frame:update(dt)
end
function Deck:draw()
    self.frame:draw()
end
return Deck
