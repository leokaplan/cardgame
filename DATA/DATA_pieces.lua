local Game = require 'src/Game'
local pieces = {}

local normaleffect = function(piece)
    return function(i,j)
        if Game.collidecross(i,j,piece.i,piece.j,1) then
            local target = Game.getpiece(i,j)
            if target then
                Game.damage(i,j,piece.attack,"physical")
            else
                Game.move(piece.i,piece.j,i,j)
            end
        end
    end
end



pieces.soldier = {
    life = 5,
    attack = 1,
    defense = 1,
    effect = normaleffect
}

pieces.captain = {
    life = 10,
    attack = 3,
    defense = 2,
    effect = normaleffect
}
return pieces
