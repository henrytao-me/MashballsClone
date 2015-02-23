local testbg = Bitmap.new(Texture.new("images/testbg.jpg", true))
stage:addChild(testbg)

local ball = Bitmap.new(Texture.new("images/ball.png", true))
ball:setPosition(0, 0)
stage:addChild(ball)

local dx = application:getLogicalTranslateX() / application:getLogicalScaleX();
local dy = application:getLogicalTranslateY() / application:getLogicalScaleY()

ball:setPosition(-dx, -dy)