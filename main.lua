local UI = require 'lib/ui/UI'
local Theme = require 'Themes/Theme'
local View = require 'UI/View' 
local Game = require 'src/Game'

function love.load()
    UI.registerEvents()
    math.randomseed(os.time())
    local W,H = love.graphics.getDimensions()
    local card = {}
        card.w = W/5 
        card.h = W/7
    local cell = {}
        cell.x = 10 --number of cells in x axis
        cell.y = 10 --number of cells in y axis
        cell.w = W/20
        cell.h = W/20
    local cards = require 'DATA/DATA_cards'
    Game.init(cell.x,cell.y)
    view = View(0,0,W,H,cell,card,cards)
end

function love.update(dt)
    view:update(dt)
end

function love.draw()
    view:draw()
end

function love.keypressed(key)
    
end
