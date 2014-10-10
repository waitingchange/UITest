local PeroData = class("PeroData",function ()
    local pData = display.newNode()
    return pData
end)

function PeroData:ctor()
    self.id = nil
	self.fileName = nil
	self.textureName = nil
	self.animations = {}
    --    {id = 1, start = 0 , finishi = 1.333 , animate = },
    --     {id = 1, start = 0 , finishi = 1.333}
	
end



function PeroData:getTimes(actionId)

    for key, var in pairs(self.animations) do

        if(var.actionID == actionId) then
            return var.start,var.last
    	end
    end

end

return PeroData

