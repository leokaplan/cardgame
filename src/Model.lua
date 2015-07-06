local Model = {}

Model.cells = {}
Model.players = {mana = nil}
Model.currentplayer = nil
Model.numplayers = nil




function Model.Turn()
    Model.currentplayer = Model.currentplayer + 1
    if Model.currentplayer > Model.numplayers then
        Model.currentplayer = 1
    end
    
    for i=1,Model.cellx do
        for j=1,Model.celly do
            local piece = Model.getcell(i,j)
            if piece and piece.passiveeffect and piece.owner == Model.currentplayer then
                piece:passiveeffect()
            end
        end
    end


end
function Model.init(cellx,celly,numplayers,initmana)
    Model.cellx,Model.celly = cellx,celly
    Model.numplayers = numplayers
    for i = 1, numplayers do
        Model.players[i] = {}
        Model.players[i].mana = initmana
    end
    Model.currentplayer = 1
    
    for i = 1, Model.cellx do
        Model.cells[i] = {}
    end
    
end
function Model.getplayer(player)
    return Model.players[player]
end
function Model.buy(player,value)
    Model.players[player].mana = Model.players[player].mana - value
end
function Model.setcell(i,j,piece)
    if i > 1  and i <= Model.cellx and j > 1 and j <= Model.celly then
        Model.cells[i][j] = piece 
    end
end
function Model.getcell(i,j)
    if i > 1  and i <= Model.cellx and j > 1 and j <= Model.celly then
        return Model.cells[i][j]
    end
end

return Model
