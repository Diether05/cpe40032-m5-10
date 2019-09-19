--[[
    GD50
    Super Mario Bros. Remake

    -- StartState Class --

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

StartState = Class{__includes = BaseState}

function StartState:init(highscore)
    self.map = LevelMaker.generate(100, 10, 'startstate')
    self.background = math.random(3)
    highlighted = 1
end

function StartState:update(dt)
    if love.keyboard.wasPressed('up') or love.keyboard.wasPressed('down') then
        highlighted = highlighted == 1 and 2 or 1
    end

    -- confirm whichever option we have selected to change screens
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then

        if highlighted == 1 then
            gStateMachine:change('play')
        else
            gStateMachine:change('high-scores')
        end
    end

end

function StartState:render()
    love.graphics.draw(gTextures['backgrounds'], gFrames['backgrounds'][2], 0, 0)
    
    love.graphics.draw(gTextures['backgrounds'], gFrames['backgrounds'][self.background], 0,
        gTextures['backgrounds']:getHeight() / 3 * 2, 0, 1, -1)
    self.map:render()

    love.graphics.draw(gTextures['start'], 40,30)

    love.graphics.setFont(gFonts['medium'])
    if highlighted == 1 then
        love.graphics.setColor(255, 255, 255, 255)
        love.graphics.printf('Play', 1, VIRTUAL_HEIGHT / 2 + 17, VIRTUAL_WIDTH, 'center')
        love.graphics.setColor(0, 0, 0, 255)
        love.graphics.printf('Play', 0, VIRTUAL_HEIGHT / 2 + 16, VIRTUAL_WIDTH, 'center')
    else
        love.graphics.setColor(0, 0, 0, 255)
        love.graphics.printf('Play', 1, VIRTUAL_HEIGHT / 2 + 17, VIRTUAL_WIDTH, 'center')
        love.graphics.setColor(255, 255, 255, 255)
        love.graphics.printf('Play', 0, VIRTUAL_HEIGHT / 2 + 16, VIRTUAL_WIDTH, 'center')
    end
    
    if highlighted == 2 then
        love.graphics.setColor(255, 255, 255, 255)
        love.graphics.printf('Highscores', 1, VIRTUAL_HEIGHT / 2 + 37, VIRTUAL_WIDTH, 'center')
        love.graphics.setColor(0, 0, 0, 255)
        love.graphics.printf('Highscores', 0, VIRTUAL_HEIGHT / 2 + 36, VIRTUAL_WIDTH, 'center')
    else
        love.graphics.setColor(0, 0, 0, 255)
        love.graphics.printf('Highscores', 1, VIRTUAL_HEIGHT / 2 + 37, VIRTUAL_WIDTH, 'center')
        love.graphics.setColor(255, 255, 255, 255)
        love.graphics.printf('Highscores', 0, VIRTUAL_HEIGHT / 2 + 36, VIRTUAL_WIDTH, 'center')
    end
end