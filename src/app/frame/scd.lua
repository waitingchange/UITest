scd = display

-- 768*1024 边界坐标
if display.width == 768 then
	scd.sleft = 64
	scd.sright = display.width - 64
	scd.stop = display.height - 32
	scd.sbottom = 32
else
	scd.sleft = display.left
	scd.sright = display.right
	scd.stop = display.top
	scd.sbottom = display.bottom
end