Settings = Core.class()

function Settings:init()
	local settings = {
		username = "Player"
	}
	
	self.isChanged = false
	
	self.sets = dataSaver.load("|D|settings")
	if(not self.sets) then
		self.sets = {}
	end
	
	for key, val in pairs(settings) do
		if self.sets[key] == nil then
			self.sets[key] = val
			self.isChanged = true
		end
	end
end

function Settings:save()
    --check if anything was changed
    if(self.isChanged)then
       self.isChanged = false
       dataSaver.save("|D|settings", self.sets)
    end
end

function Settings:get(key)
    return self.sets[key]
end
 
function Settings:set(key, value, autosave)
    if(self.sets[key] == nil or self.sets[key] ~= value) then
		self.sets[key] = value
		self.isChanged = true
	end
	if autosave then
		self:save()
	end 
end 