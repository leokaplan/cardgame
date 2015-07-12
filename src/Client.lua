local Client = {}
Client.states = {}
Client.current = nil
function Client.setstate(state)
    Client.current = state
--    Client.states[state].init()
end

return Client
