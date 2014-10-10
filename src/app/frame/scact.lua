scact = {}

-- 序列动作对象
function scact.sequence( ... )
	local args = {...}
	local seqArr = cc.Array:create()
	for i=1,#args do
		seqArr:addObject(args[i])
	end
	return cc.Sequence:create(seqArr)
end

-- 并行动作对象
function scact.spawn( ... )
	local args = {...}
	local seqArr = cc.Array:create()
	for i=1,#args do
		seqArr:addObject(args[i])
	end
	return cc.Spawn:create(seqArr)
end

-- 帧动画
-- imageName 图片名
-- imageNumber 图片数量（帧数）
-- frameTime  运行时间
-- scact.animate("a_",2,0.2)  资源有 a_1.png,a_2.png
function scact.animate( imageName,imageNumber,frameTime ,isRestoreOriginalFrame)
    isRestoreOriginalFrame = isRestoreOriginalFrame or false
	local animation = cc.Animation:create()
	for i = 1, imageNumber do
        name = imageName .. i .. ".png"
        animation:addSpriteFrameWithFile(name)
    end
    animation:setDelayPerUnit(frameTime / imageNumber)
    animation:setRestoreOriginalFrame(isRestoreOriginalFrame)
   	return cc.Animate:create(animation)
end

-- 重复动作
function scact._repeat(action,times)
	if times == nil or times == 0 then
		return cc.RepeatForever:create(action)
	else
		return cc.Repeat:create(action,times)
	end
end

-- 延时动作
function scact.delaytime(delay)
	return cc.DelayTime:create(delay)
end
-- 回调动作
function scact.callfunc(func)
	return cc.CallFunc:create(func)
end

--	渐变到一个固定透明度
function scact.fadeTo(time, opacity)
    return cc.FadeTo:create(time, opacity)
end
--	渐隐动画
function scact.fadeOut(time)
    return cc.FadeOut:create(time)
end
--	渐显动画
function scact.fadeIn(time)
    return cc.FadeIn:create(time)
end

--	在一段时间内移动结点到特定位置
function scact.moveto( time, x, y )
	return cc.MoveTo:create(time, cc.p(x,y))
end

-- 	在一段时间内移动相对位置
function scact.moveBy(time, x, y)
    return cc.MoveBy:create(time, cc.p(x or 0, y or 0))
end

--	在一段时间内旋转的角度
function scact.rotateTo(time, rotation)
    return cc.RotateTo:create(time, rotation)
end

--	在一段时间内旋转的相对角度
function scact.rotateBy(time, rotation)
    return cc.RotateBy:create(time, rotation)
end

--	在一段时间内缩放
function scact.scaleTo(time, scale)
    return cc.ScaleTo:create(time, scale)
end

--	在一段时间内的相对缩放
function scact.scaleBy(time, scale)
    return cc.ScaleBy:create(time, scale)
end