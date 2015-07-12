


local Statusbar = {}
Statusbar.draw = function(self)
    love.graphics.setColor(255,255,255) 
    local img = Images.logo
    love.graphics.draw(
        img,
        self.x,
        self.y,
        0,
        self.w/img:getWidth(),
        self.h/(2*img:getHeight())
    )
end
Statusbar.update = function(self)
end
return Statusbar
