local Model = {}

function Model.init(cellx,celly)
    Model.cellx,Model.celly = cellx,celly
    Model.cells = {}
    for i = 1, Model.cellx do
        Model.cells[i] = {}
    end
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
