require "box2d"

sceneManager = SceneManager.new({
	['start'] = StartScene,
	['about'] = AboutScene,
	['options'] = OptionsScene,
	['level'] = LevelScene,
	["levelselect"] = LevelSelectScene
})
stage:addChild(sceneManager)

sets = Settings.new()

sceneManager:changeScene('start', 1, conf.transition, conf.easing)

gm = GameManager.new()

--background music
music = Music.new("sounds/main.mp3")

--when music gets enabled
music:addEventListener("musicOn", function()
 sets:set("music", true, true)
end)
--when music gets disabled
music:addEventListener("musicOff", function()
   sets:set("music", false, true)
end)

--play music if enabled
if sets:get("music") then
 music:on()
end

--sounds
sounds = Sounds.new()
--set up sound events
--when sounds turn on
sounds:addEventListener("soundsOn", function()
 sets:set("sounds", true, true)
end)
--when sounds turn off
sounds:addEventListener("soundsOff", function()
 sets:set("sounds", false, true)
end)
--enable sounds if setting enabled
if sets:get("sounds") then
 sounds:on()
end

sounds:add("complete", "sounds/complete.wav")
sounds:add("hit", "sounds/hit0.wav")
sounds:add("hit", "sounds/hit1.wav")
sounds:add("hit", "sounds/hit2.wav")
sounds:add("hit", "sounds/hit3.wav")

