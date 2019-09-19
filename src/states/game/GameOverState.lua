GameOverState = Class{__includes = BaseState}

function GameOverState:init(highscores)
    self.map = LevelMaker.generate(100, 10, 'startstate')
    self.background = math.random(3)
end

function GameOverState:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        -- see if score is higher than any in the high scores table
        highScore = true
        highScore = highscores:check()

        if highScore then
            gStateMachine:change('enter-high-score') 
        else 
            gStateMachine:change('start') 
        end
    end

    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end
end

function GameOverState:render()
    love.graphics.draw(gTextures['backgrounds'], gFrames['backgrounds'][self.background], 0, 0)
    love.graphics.draw(gTextures['backgrounds'], gFrames['backgrounds'][self.background], 0,
        gTextures['backgrounds']:getHeight() / 3 * 2, 0, 1, -1)
    self.map:render()


    love.graphics.setFont(gFonts['title'])
    love.graphics.setColor(0, 0, 0, 255)
    love.graphics.printf('GAME OVER', 1, VIRTUAL_HEIGHT / 3 + 1, VIRTUAL_WIDTH, 'center')
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.printf('GAME OVER', 0, VIRTUAL_HEIGHT / 3, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(gFonts['medium'])
    love.graphics.setColor(0, 0, 0, 255)
    love.graphics.printf('Final Score: ' .. tostring(highscores.score), 1, VIRTUAL_HEIGHT / 2 + 10,
        VIRTUAL_WIDTH, 'center')
    love.graphics.printf('Press Enter!', 1, VIRTUAL_HEIGHT - VIRTUAL_HEIGHT / 4 + 1,
        VIRTUAL_WIDTH, 'center')
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.printf('Final Score: ' .. tostring(highscores.score), 0, VIRTUAL_HEIGHT / 2 + 9, 
        VIRTUAL_WIDTH, 'center')
    love.graphics.printf('Press Enter!', 0, VIRTUAL_HEIGHT - VIRTUAL_HEIGHT / 4,
        VIRTUAL_WIDTH, 'center')


end