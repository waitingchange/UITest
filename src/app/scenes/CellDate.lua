local CellDate = class("CellDate",function ()
    local cData = display.newNode()
    return cData
end)
--        8*8的格，每一个格中对应的元素的一些属性
--        砖块的类型 、 在哪一个层、是否可以移动、当前是否可移动、

--              

function CellDate:ctor()
	self.type = nil
	self.inLayer = nil
	self.moveable = true
	self.cmoveable = false
	
	
    self.mRow = 0
    self.mRank = 0
    
	self.picFileName = nil
	self.aniMationName = nil
	
	self.skill = nil
	self.action = {}
	
--	actionid actionName
	
end


function CellDate:IsPic()
    return  (not self.picFileName == false)
end

function CellDate:getAction(actionId)
	for key, var in pairs(self.action) do
        if actionId == var.actionid then
            return var.actionName
		end
	end
end




return CellDate