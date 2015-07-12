
local UI = require 'lib/ui/UI'
local Theme = require 'Themes/Theme'
local utils = {}
function utils.newb(x,y,w,h,t,f)
    local a = UI.Button(x,y,w,h, {extensions = {Theme.MenuButton}} )
        a.text = t
        a.func = f
    return a
end
return utils
