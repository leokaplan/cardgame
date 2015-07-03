
local Deck = {}
Deck.draw = function(self)
    -- Draw scrollarea frame
    love.graphics.setColor(32, 32, 32)
    love.graphics.rectangle('fill', self.x, self.y, self.w, self.h)

    -- Draw scrollbars background
    love.graphics.setScissor()
    love.graphics.setColor(64, 64, 64)
    if self.show_scrollbars then
        if self.vertical_scrolling then
            love.graphics.rectangle('fill', self.x + self.x_offset + self.area_width, self.y + self.y_offset + self.scroll_button_height, 
                                            self.scroll_button_width, self.area_height - 2*self.scroll_button_height)
        end
    end
end
return Deck
