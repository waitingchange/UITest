local SCButton = class("SCButton",function (  )
	return cc.ui.UIPushButton.new()
end)

SCButton.NORMAL   = "normal"
SCButton.PRESSED  = "pressed"
SCButton.DISABLED = "disabled"

function SCButton:ctor( img,callback,text )
	self:setButtonImage(SCButton.NORMAL,img)
	if callback then
		self:onButtonClicked(callback)
	end
	if text then
		self:setButtonLabel(SCButton.NORMAL,scui.labelC(text))
	end
end

-- 单击事件
function SCButton:setClicked( callback )
	self:onButtonClicked(callback)
end

-- 图片
function SCButton:updateButtonImage_()
    local state = self.fsm_:getState()
    local image = self.images_[state]

    if self.currentImage_ == nil then
    	self.currentImage_ = image
    end
    if self.sprite_[1] == nil then
    	self.sprite_[1] = display.newScale9Sprite(self.currentImage_)
    	self:addChild(self.sprite_[1])
    end
    
    if state == SCButton.NORMAL then
    	if self.sprite_[1] then
    		self.sprite_[1]:scale(1)
    	end
    elseif state == SCButton.PRESSED then
    	if self.sprite_[1] then
    		self.sprite_[1]:scale(0.95)
    	end
    elseif state == SCButton.DISABLED then
    	if self.sprite_[1] then
    		self.sprite_[1]:removeFromParent(true)
    		self.sprite_[1] = display.newGraySprite(self.currentImage_)
    		self:addChild(self.sprite_[1])
    	end
    end
end

-- 设置按钮字体大小
function SCButton:setTextSize( size )
	local label = self:getButtonLabel()
	if label then
		label:setSystemFontSize(size)
	end
end

-- 设置按钮文字颜色
function SCButton:setTextColor( color )
	local label = self:getButtonLabel()
	if label then
		label:setTextColor(color)
	end
end

-- 设置按钮文字颜色
function SCButton:setText( text,size,color)
	local label = self:getButtonLabel()
	if label then
		label:setString(text)
	else
		self:setButtonLabel(SCButton.NORMAL,scui.labelC(text,size,color))
	end
end

-- 设置按钮是否可用
function SCButton:setEnabled( enabled)
	self:setButtonEnabled(enabled)
end
return SCButton