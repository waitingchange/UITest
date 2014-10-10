scui = {}

local FRAME_MODULE_NAME = string.sub(..., 1, -6)

function scui.label( text ,size,color,width)
    local dimensions
    if width then
        dimensions = cc.size(width,0)
    end
    return display.newTTFLabel({
            text = text,
            size = size,
            color = color,
            dimensions = dimensions
        }):align(display.CENTER_LEFT)
end

function scui.labelC( text ,size,color,width )
    return scui.label( text ,size,color,width):align(display.CENTER)
end

function scui.labelR( text ,size,color,width )
    return scui.label( text ,size,color,width):align(display.CENTER_RIGHT)
end

-- 生成一个简单按钮
function scui.btn( btnImg,callBack,text)
	local btn = require(FRAME_MODULE_NAME..".SCButton").new(btnImg,callBack,text)
	return btn
end

function scui.newlabelAtlas( text,fontImg,width,height,firstChar )
    -- firstChar = firstChar or 48
    local label = cc.Label:createWithCharMap(fontImg,width,height,firstChar)
    label:setString(text)
    return label
end