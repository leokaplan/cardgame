
local Game = require 'src/Game'
local pieces = require 'DATA/DATA_pieces'

local function piece(name,cost)
    return {
        name = name,
        cost = cost,
        desc = "spawn a "..name,
        effect = function(i,j)
            return Game.spawn(i,j,pieces[name])
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
        return true
    end
}
cards.thunder = {
    name = "thunder",
    desc = "does 5 damage in a single cell",
    cost = 5,
    effect = function(i,j)
        return Game.damage(i,j,5,"magical")
    end
}
cards.heal = {
    name = "heal",
    desc = "heal a unit in 2 points",
    cost = 3,
    effect = function(i,j)
        return Game.damage(i,j,-2,"magical")
    end
}
cards.soldier = piece("soldier",1)
cards.captain = piece("captain",3)
cards.tower = piece("tower",1)
return cards
