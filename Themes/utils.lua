
local utils = {}
function utils.drawimg(img,x,y,w,h)
    love.graphics.draw(
        img,
        x,
        y,
        0,
        w/img:getWidth(),
        h/img:getHeight()
    )
end
return utils
