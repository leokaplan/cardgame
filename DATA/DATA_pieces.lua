local Game = require 'src/Game'
local pieces = {}

local normaleffect = function(piece)
    return function(i,j)
        if piece.move.fun(i,j,piece.i,piece.j,piece.move.size) then
            if piece.target.fun(i,j,piece.i,piece.j,piece.target.size) then
                local target = Game.getpiece(i,j)
                if target then
                    Game.damage(i,j,piece.attack,"physical")
                end
            end
            Game.move(piece.i,piece.j,i,j)
        end
    end
end



pieces.soldier = {
    life = 5,
    attack = 1,
    defense = 1,
    move = {fun = Game.collidecross, size = 1},
    target = {fun = Game.collidecross, size = 1},
    effect = normaleffect
}

pieces.captain = {
    life = 10,
    attack = 3,
    defense = 2,
    move = {fun = Game.collidecross, size = 1},
    target = {fun = Game.collidecross, size = 1},
    effect = normaleffect
}
return pieces
