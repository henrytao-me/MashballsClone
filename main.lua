sceneManager = SceneManager.new({
	['start'] = StartScene,
	['about'] = AboutScene,
	['options'] = OptionsScene
})
stage:addChild(sceneManager)

sets = Settings.new()

sceneManager:changeScene('start', 1, conf.transition, conf.easing)