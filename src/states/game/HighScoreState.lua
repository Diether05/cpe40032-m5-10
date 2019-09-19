HighScoreState = Class{__includes = BaseState}
 local init = love.math.random(3)
function HighScoreState:init(highscores)
end

function HighScoreState:update(dt)
    if love.keyboard.isDown('space') then
        gStateMachine:change('start')
    end
end

function HighScoreState:render()
    love.graphics.draw(gTextures['backgrounds'], gFrames['backgrounds'][init], 0, 0)
    
    -- love.graphics.draw(gTextures['start'], 40,30)
    love.graphics.setFont(gFonts['medium'])
    love.graphics.printf('High Scores', 0, 10, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(gFonts['small'])

    -- iterate over all high score indices in our high scores table
    for i = 1, 10 do
        local name = highscores.highScores[i].name or '---'
        local score = highscores.highScores[i].score or '---'

        -- score number (1-10)
        love.graphics.printf(tostring(i) .. '.', VIRTUAL_WIDTH / 4, 
            20 + i * 10, 80, 'left')

        -- score name
        love.graphics.printf(name, VIRTUAL_WIDTH / 4 + 8, 
            20 + i * 10, 40, 'right')
        
        -- score itself
        love.graphics.printf(tostring(score), VIRTUAL_WIDTH / 2,
            20 + i * 10, 50, 'right')
    end

    love.graphics.setFont(gFonts['small'])
    love.graphics.printf("Press Backspace to return to the main menu!",
        0, VIRTUAL_HEIGHT - 15, VIRTUAL_WIDTH, 'center')
        
end
