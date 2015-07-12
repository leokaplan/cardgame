local Client = {}
local UI = require 'lib/ui/UI'
local Theme = require 'Themes/Theme'
Client.states = {}
Client.current = nil
function Client.setstate(state)
    Client.current = state
--    Client.states[state].init()
end
function Client.newb(x,y,w,h,t,f)
    local a = UI.Button(x,y,w,h, {extensions = {Theme.MenuButton}} )
        a.text = t
        a.func = f
    return a
end

return Client
