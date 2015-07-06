local Model = require 'src/Model'

local Game = {}
Game.effect = nil
Game.cost = nil

function Game.init(cellx,celly,numplayers,initlife)
    Model.init(cellx,celly,numplayers,initlife)
end
function Game.selectedeffect(i,j)
   Game.effect(i,j)
   Game.buy(Game.cost)
end
function Game.selecteffect(effect,cost)
    Game.effect = effect
    Game.cost = cost
end
function Game.turn()
    Model.Turn()
end
function Game.getcurrentplayer()
    return Model.currentplayer
end
function Game.getplayers()
    return Model.players
end
function Game.buy(value)
    local player = Game.getcurrentplayer()
    if Model.getplayer(player).mana >= value then
        Model.buy(player, value)
    end
end

function Game.damage(i,j,dmg,kind)
    local piece = Model.getcell(i,j)
    local damage
    if piece then
        if kind == "physical" then
            damage = dmg - piece.defense
            damage = damage > 0 and damage or 0
        elseif kind == "magical" then
            damage = dmg
        else
            damage = 0
        end
        piece.life = piece.life - damage
        if piece.life <= 0 then
            Model.setcell(i,j,nil)
        end
    end
end
function Game.newpiece(i,j,owner,piece)
    return {
        life = piece.life, 
        attack = piece.attack, 
        defense = piece.defense, 
        effect = piece.effect, 
        passiveeffect = piece.passiveeffect, 
        move = piece.move, 
        target = piece.target, 
        cost = piece.cost, 
        i = i , 
        j = j,
        owner = owner
    }
end
function Game.spawn(i,j,piece)
    local cell = Model.getcell(i,j)
    local player = Game.getcurrentplayer()
    if not cell then
        Model.setcell(i,j,Game.newpiece(i,j,player,piece))
    end
end
function Game.getpiece(i,j)
   return Model.getcell(i,j)
end
function Game.collidecross(i,j,a,b,size)
    if  Game.collidelinehor(i,j,a,b,size) or Game.collidelinever(i,j,a,b,size) then
        return true 
    else
        return false
    end
end
function Game.area(fun)
    local ret = {}
    for i=1,Model.cellx do
        for j=1,Model.celly do
            if fun(i,j) then
                table.insert(ret,{i=i,j=j})
            end
        end
    end
    return ret
end
function Game.collidelinehor(i,j,a,b,size)
    if  math.abs(i-a) <= size and j == b then
        return true 
    else
        return false
    end
end
function Game.collidelinever(i,j,a,b,size)
    if  math.abs(j-b) <= size and i == a then
        return true 
    else
        return false
    end
end
function Game.move(i0,j0,i,j)
    if not Model.getcell(i,j) then

        local piece = Model.getcell(i0,j0)
        piece.i = i
        piece.j = j
        Model.setcell(i,j,piece)
        Model.setcell(i0,j0,nil)
    end
end

return Game
