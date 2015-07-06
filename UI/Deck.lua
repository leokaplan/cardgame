local UI = require 'lib/ui/UI'
local Theme = require 'Themes/Theme'
local Card = require 'UI/Card'
local Deck = UI.Object:extend('Deck')

function Deck:new(x, y, w, h, cards, cardw,cardh)
    self.spacing = 5
    self.margin = 5
    local hsize = #cards > math.floor(h/cardh) and #cards or math.floor(h/cardh)

    self.frame = UI.Scrollarea(0, 0, w+2*self.spacing, hsize*cardh, {extensions = {Theme.Deck}, auto_align = true, auto_spacing = self.spacing, auto_margin = self.margin, show_scrollbars = true, area_width = w, area_height = h})
    i = 1
    for k,v in pairs(cards) do
        self.frame:addElement(Card(0,i*cardh,cardw-2*self.spacing,cardh,v).button)
        i = i + 1
    end
end
function Deck:update(dt)
    self.frame:update(dt)
end
function Deck:draw()
    self.frame:draw()
end
return Deck
