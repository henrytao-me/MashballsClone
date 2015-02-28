require "box2d"

sceneManager = SceneManager.new({
	['start'] = StartScene,
	['about'] = AboutScene,
	['options'] = OptionsScene,
	['level'] = LevelScene
})
stage:addChild(sceneManager)

sets = Settings.new()

sceneManager:changeScene('start', 1, conf.transition, conf.easing)