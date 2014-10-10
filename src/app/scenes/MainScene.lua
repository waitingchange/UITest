
--        进入， 待机，技能，胜利，失败，收到攻击，攻击 , 悠闲，跑动
ACT_ENTER = 1
ACT_STAY = 2
ACT_SKILL = 3
ACT_WIN = 4
ACT_FAIL = 5
ACT_HIT = 6
ACT_ATTACK = 7
ACT_IDLE = 8
ACT_RUN = 9


local Person = import("src/app/scenes/PeroData.lua")


local MainScene = class("MainScene", function()
    return display.newScene("MainScene")
end)


MainScene.SLIDER_IMAGES = {
    bar = "res/SliderBar.png",
    button = "res/SliderButton.png",
}

function MainScene:ctor()
--   self:Test()
--   self:addLayer()
--   self:addLabelTest()

--   self:addSliender()
--      self:createPageView()

        self:addObjects()
end

function MainScene:addObjects()
	self.boss = Person.new()
    self.boss.id = 1
    self.boss.fileName = "" -- 空着
    self.boss.textureName = ""
    self.boss.animations[1] = {actionID = ACT_ENTER ,start = 0 , last = 1.3667 }
    self.boss.animations[2] = {actionID = ACT_STAY,start = 1.4667, last = 1.3333}
    self.boss.animations[3] = {actionID = ACT_SKILL,start = 2.9 , last = 1.1333}
    self.boss.animations[4] = {actionID = ACT_WIN,start = 4.1333 , last = 1.3333}
    self.boss.animations[5] = {actionID = ACT_FAIL,start = 5.5667 , last = 1.0667}
    self.boss.animations[6] = {actionID = ACT_HIT,start = 6.7333 , last = 0.5667}
	
	
	self.hero = Person.new()
    self.hero.id = 1
    self.hero.fileName = "" -- 空着
    self.hero.textureName = ""
    self.hero.animations[1] = {actionID = ACT_STAY,start = 0 , last = 1.3333 }
    self.hero.animations[2] = {actionID = ACT_RUN,start = 1.5, last = 0.4}
    self.hero.animations[3] = {actionID = ACT_ATTACK,start = 2.0667 , last = 1.2333}
    self.hero.animations[4] = {actionID = ACT_IDLE,start = 3.5 , last = 1.5667}
    self.hero.animations[5] = {actionID = ACT_WIN,start = 5.2333 , last = 2.3333}
    self.hero.animations[6] = {actionID = ACT_FAIL,start = 7.7333 , last = 2.3333}

--    self.hero2 =  Person.new()
--    self.hero2.animations[1] = {1,1.0,1.33}
--    self.hero2.animations[2] = {2,1.0,1.33}
--    self.hero2.animations[3] = {3,1.0,1.33}
    local start,last = self.hero:getTimes(3)
	
    print("时间是。。"..start.."持续时间"..last)
	
end

function MainScene:createPageView()
    self.pv = cc.ui.UIPageView.new {

        viewRect = cc.rect(80, 80, 780, 480),
        column = 3, row = 3,
        padding = {left = 20, right = 20, top = 20, bottom = 20},
        columnSpace = 10, rowSapce = 10}
        :onTouch(handler(self, self.touchListener))
        :addTo(self)

    -- add items
    for i=1,18 do
        local item = self.pv:newItem()
        local content

        content = display.newColorLayer(
            cc.c4b(math.random(250),
                math.random(250),
                math.random(250),
                250))
        content:setContentSize(240, 140)
        content:setTouchEnabled(false)
        item:addChild(content)
        self.pv:addItem(item)        
    end
    self.pv:reload()
end


function MainScene:touchListener(event)
    dump(event, "MainScene - event:")
    local listView = event.listView
    if 3 == event.itemPos then
        listView:removeItem(event.item, true)
    else
    end
end

function MainScene:addSliender()

    local barHeight = 40
    local barWidth = 400
    local valueLabel = cc.ui.UILabel.new({text = "", size = 14, color = display.COLOR_RED})
        :align(display.LEFT_CENTER, display.left + barWidth + 60, display.top - 60)
        :addTo(self)
    cc.ui.UISlider.new(display.LEFT_TO_RIGHT, MainScene.SLIDER_IMAGES, {scale9 = true})
        :onSliderValueChanged(function(event)
            valueLabel:setString(string.format("value = %0.2f", event.value))
        end)
        :setSliderSize(barWidth, barHeight)
        :setSliderValue(75)
        :align(display.LEFT_BOTTOM, display.left + 40, display.top - 80)
        :addTo(self)
end

function MainScene:addLabelTest()

   local TestLabel = cc.ui.UILabel.new(
        {text = "item",
            size = 80,
            color = display.COLOR_RED})
            :align(display.CENTER)
            :pos(display.cx , display.cy)
            :addTo(self)
    
    local sp2 = display.newScale9Sprite("res/sunset.png")
    sp2:setContentSize(300, 200)
    sp2:pos(display.cx, display.cy)
    
    local emptyNode = cc.Node:create()
    emptyNode:addChild(sp2)
    
    local bound = sp2:getBoundingBox()
    bound.width = 300
    bound.height = 200
    
    cc.ui.UIScrollView.new({viewRect = bound})
        :addScrollNode(emptyNode)
       
        :onScroll(handler(self, self.scrollListener))
        :addTo(self)
    
end

function MainScene:scrollListener(event)

end


function MainScene:addLayer()
    display.newColorLayer(cc.c4b(255, 255, 255, 255))
    :addTo(self)

    for y = display.bottom, display.top, 40 do
        display.newLine(
            {{display.left, y}, {display.right, y}},
            {borderColor = cc.c4f(0.9, 0.9, 0.9, 1.0)})
            :addTo(self)
    end

    for x = display.left, display.right, 40 do
        display.newLine(
            {{x, display.top}, {x, display.bottom}},
            {borderColor = cc.c4f(0.9, 0.9, 0.9, 1.0)})
            :addTo(self)
    end

    display.newLine(
        {{display.left, display.cy + 1}, {display.right, display.cy + 1}},
        {borderColor = cc.c4f(1.0, 0.75, 0.75, 1.0)})
        :addTo(self)

    display.newLine(
        {{display.cx, display.top}, {display.cx, display.bottom}},
        {borderColor = cc.c4f(1.0, 0.75, 0.75, 1.0)})
        :addTo(self)
end

function MainScene:Test()
    local label = scui.label("123123")
        :pos(display.cx,display.cy)
    self:addChild(label)
    local label = scui.labelC("123123")
        :pos(display.cx,display.cy-100)
    self:addChild(label)
    local label = scui.labelR("123123")
        :pos(display.cx,display.cy+100)
    self:addChild(label)


    cc.ui.UIPushButton.new("dog.png")
        :onButtonPressed(function(event)
            event.target:setScale(1.2)
        end)
        :onButtonRelease(function(event)
            event.target:setScale(1.0)
        end)
        :onButtonClicked(function(event)
            print("adadfdfafs")
        end)
        :pos(display.cx - 200,display.cy + 100)
        :addTo(self)


end

function MainScene:onEnter()
end

function MainScene:onExit()
end

return MainScene
