

local Themeutils = require 'Themes/utils'

local Statusbar = {}
Statusbar.draw = function(self)
    love.graphics.setColor(255,255,255) 
    Themeutils.drawimg(Images.logo,self.x,self.y,self.w,self.h/2)
end
Statusbar.update = function(self)
end
return Statusbar
