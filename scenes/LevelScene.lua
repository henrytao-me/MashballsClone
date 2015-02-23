LevelScene = Core.class(Sprite)

function LevelScene:init()
	local bg = Bitmap.new(Texture.new("images/bg.jpg", true))
	bg:setAnchorPoint(0.5, 0.5)
	bg:setPosition(conf.width/2, conf.height/2)
	self:addChild(bg)
	
	self.g = TexturePack.new("texturepacks/LevelScene.txt", "texturepacks/LevelScene.png", true)
	
	local restart = Bitmap.new(self.g:getTextureRegion("restart.png"))
	local restartButton = Button.new(restart)
	restartButton:setPosition(-conf.dx, conf.dy + conf.height - restartButton:getHeight())
	self:addChild(restartButton)
	restartButton:addEventListener("click", function()
		sceneManager:changeScene("level", conf.transitionTime, conf.transition, conf.easing)
	end)
	
	local menu = Bitmap.new(self.g:getTextureRegion("menu.png"))
	local menuButton = Button.new(menu)
	menuButton:setPosition(conf.dx + conf.width - menuButton:getWidth(), conf.dy + conf.height - menuButton:getHeight())
	self:addChild(menuButton)
	menuButton:addEventListener("click", function(self)
		self:openMenu()
	end, self)
	
	self:addEventListener(Event.KEY_DOWN, function(event)
		if event.keyCode == KeyCode.BACK then
			self:back()
		end
	end)
end

function LevelScene:back()
    sceneManager:changeScene("start", conf.transitionTime, conf.transition, conf.easing)
end

function LevelScene:createMenu()
	local menu = Shape.new()
	menu:setFillStyle(Shape.SOLID, 0x000000, 0.5)
	menu:beginPath()
	menu:moveTo(-conf.dx,-conf.dy)
	menu:lineTo(-conf.dx, conf.height + conf.dy)
	menu:lineTo(conf.width + conf.dy, conf.height + conf.dy)
	menu:lineTo(conf.width + conf.dy, -conf.dy)
	menu:closePath()
	menu:endPath()
   
	--disable input events
	menu:addEventListener(Event.MOUSE_DOWN, function(e)
     e:stopPropagation() end)
	menu:addEventListener(Event.MOUSE_MOVE, function(e)
     e:stopPropagation() end)
	menu:addEventListener(Event.MOUSE_UP, function(e)
     e:stopPropagation() end)
	menu:addEventListener(Event.TOUCHES_BEGIN, function(e)
     e:stopPropagation() end)
	menu:addEventListener(Event.TOUCHES_MOVE, function(e)
     e:stopPropagation() end)
	menu:addEventListener(Event.TOUCHES_END, function(e)
     e:stopPropagation() end)
	 
	--add buttons
	local resume = Bitmap.new(self.g:getTextureRegion("resume.png"))
	resume:setAnchorPoint(0.5, 0.5)
	local resumeButton = Button.new(resume)
	resumeButton:setPosition(conf.width/2, 100)
	resumeButton:addEventListener("click", self.closeMenu, self)
	menu:addChild(resumeButton)
	 
	return menu
end

function LevelScene:openMenu()
	self.paused = true
	if not self.menu then
		self.menu = self:createMenu()
	end
	self:addChild(self.menu)
end

function LevelScene:closeMenu()
    self:removeChild(self.menu)
    self.paused = false
end
