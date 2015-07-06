
local Game = require 'src/Game'
local pieces = require 'DATA/DATA_pieces'

local function piece(name,cost)
    return {
        name = name,
        desc = "spawn a "..name,
        effect = function(i,j)
            Game.spawn(i,j,pieces[name])
        end
    }
end
local cards = {}
cards.fireball = {
    name = "fireball",
    desc = "does damage in a small area(2 and then 1)",
    cost = 3,
    effect = function(i,j)
        Game.damage(i,j,2,"magical")
        Game.damage(i-1,j,1,"magical")
        Game.damage(i,j-1,1,"magical")
        Game.damage(i+1,j,1,"magical")
        Game.damage(i,j+1,1,"magical")
    end
}
cards.thunder = {
    name = "thunder",
    desc = "does 5 damage in a single cell",
    cost = 5,
    effect = function(i,j)
        Game.damage(i,j,5,"magical")
    end
}
cards.heal = {
    name = "heal",
    desc = "heal a unit in 2 points",
    cost = 3,
    effect = function(i,j)
        Game.damage(i,j,-2,"magical")
    end
}
cards.soldier = {
    name = "soldier",
    desc = "spawns a soldier",
    cost = 1,
    effect = function(i,j)
        Game.spawn(i,j,pieces.soldier,cards.soldier.cost)
    end
}
cards.captain = {
    name = "captain",
    desc = "spawns a captain",
    cost = 3,
    effect = function(i,j)
        Game.spawn(i,j,pieces.captain,cost)
    end
}
return cards
