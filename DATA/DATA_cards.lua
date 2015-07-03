
local Game = require 'src/Game'
local pieces = require 'DATA/DATA_pieces'


local fireball = {}
fireball.name = "fireball"
fireball.desc = "does damage in a small area(2 and then 1)"
fireball.effect = function(i,j)
    Game.damage(i,j,2,"magical")
    Game.damage(i-1,j,1,"magical")
    Game.damage(i,j-1,1,"magical")
    Game.damage(i+1,j,1,"magical")
    Game.damage(i,j+1,1,"magical")
end
local thunder = {}
thunder.name = "thunder"
thunder.desc = "does 5 damage in a single cell"
thunder.effect = function(i,j)
    Game.damage(i,j,5,"magical")
end
local heal = {}
heal.name = "heal"
heal.desc = "heal a unit in 2 points"
heal.effect = function(i,j)
    Game.damage(i,j,-2,"magical")
end
local soldier = {}
soldier.name = "soldier"
soldier.desc = "spawns a soldier"
soldier.effect = function(i,j)
    Game.spawn(i,j,pieces.soldier)
end
local captain = {}
captain.name = "captain"
captain.desc = "spawns a captain"
captain.effect = function(i,j)
    Game.spawn(i,j,pieces.captain)
end

local cards = {fireball,thunder,heal,soldier,captain}
return cards
