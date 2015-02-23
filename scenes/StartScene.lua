StartScene = Core.class(Sprite)

function StartScene:init() 
	local bg = Bitmap.new(Texture.new('images/bg.jpg', true))
	bg:setAnchorPoint(0.5, 0.5)
	bg:setPosition(conf.width / 2, conf.height / 2)
	self:addChild(bg)
	
	local logo = Bitmap.new(Texture.new("images/logo.png", true))
	logo:setAnchorPoint(0.5, 0.5)
	logo:setPosition(conf.width/2, conf.height/2 - 50)
	self:addChild(logo)
	
	local startText = TextField.new(conf.fontLarge, 'Start Game')
	startText:setTextColor(0xffff00)
	local startButton = Button.new(startText)
	startButton:setPosition((conf.width - startButton:getWidth())/2, conf.height - 70)
	startButton:addEventListener('click', function() 
		sceneManager:changeScene('level', conf.transitionTime, conf.transition, conf.easing)
	end)
	self:addChild(startButton)
	
	local optionsText = TextField.new(conf.fontMedium, 'Options')
	optionsText:setTextColor(0xffff00)
	local optionsButton = Button.new(optionsText)
	optionsButton:setPosition(50, conf.height - 50)
	self:addChild(optionsButton)
	optionsButton:addEventListener('click', function()
		sceneManager:changeScene('options', conf.transitionTime, conf.transition, conf.easing)
	end)
	
	local aboutText = TextField.new(conf.fontMedium, 'About')
	aboutText:setTextColor(0xffff00)
	local aboutButton = Button.new(aboutText)
	aboutButton:setPosition(conf.width - aboutButton:getWidth() - 50, conf.height - 50)
	self:addChild(aboutButton)
	aboutButton:addEventListener('click', function()
		sceneManager:changeScene('about', conf.transitionTime, conf.transition, conf.easing)
	end)

	local texture = Texture.new('images/ball.png', true)
	local bmp = Bitmap.new(texture)
	local button = Button.new(bmp)
	button:addEventListener('click', function() 
		print('you just clicked me')
	end)
	self:addChild(button)
	
	self:addEventListener(Event.KEY_DOWN, function(event)
	if event.keyCode == KeyCode.BACK then
		if application:getDeviceInfo() == "Android" then
			application:exit()
		end end
	end)
end