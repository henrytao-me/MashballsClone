MainBall = Core.class(Sprite)

function MainBall:init(level, x, y)
	self.level = level
	self:setPosition(x,y)
	
	--create bitmap object from ball graphic
	self.bitmap = Bitmap.new(self.level.g:getTextureRegion("main1.png"))
	--reference center of the ball for positioning
	self.bitmap:setAnchorPoint(0.5,0.5)
	self:addChild(self.bitmap)
	
	local radius = self.bitmap:getWidth() / 2 * 0.85
	
	--create box2d physical object
	local body = self.level.world:createBody{type = b2.DYNAMIC_BODY}
	body:setPosition(self:getPosition())
	body:setAngle(math.rad(self:getRotation()))
	
	local circle = b2.CircleShape.new(0, 0, radius)
	local fixture = body:createFixture({
		shape = circle,
		density	 = 1.0,
		friction = 0.1,
		restitution = 0.5
	})
	
	body.type = 'main'
	self.body = body
	body.object = self
	
	table.insert(self.level.bodies, body)
end