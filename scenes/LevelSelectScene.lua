LevelSelectScene = Core.class(Sprite)

function LevelSelectScene:init() 
	local bg = Bitmap.new(Texture.new('images/bg.jpg', true))
	bg:setAnchorPoint(0.5, 0.5)

	bg:setPosition(conf.width/2, conf.height/2)
	self:addChild(bg)
	local backText = TextField.new(conf.fontMedium, "Back")
	backText:setTextColor(0xffff00)
	local backButton = Button.new(backText)
	backButton:setPosition((conf.width - backButton:getWidth()) / 2, conf.height - 30)
	self:addChild(backButton)
	backButton:addEventListener("click", function() 
		sceneManager:changeScene("start", conf.transitionTime, conf.transition, conf.easing)
	end)

	self:addEventListener(Event.KEY_DOWN, function(event)
		if event.keyCode == KeyCode.BACK then
		 	sceneManager:changeScene("start", conf.transitionTime, conf.transition, conf.easing)
		end 
	end)

	self.curPack = sets:get("curPack")
	
	local packHeading = TextField.new(conf.fontMedium, packs[self.curPack].name)
 	packHeading:setTextColor(0xffff00)
 	packHeading:setPosition((conf.width - packHeading:getWidth())/2, 50)
	self:addChild(packHeading)

end