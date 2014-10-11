
--        最大的砖块得分
M_B_SCORE = 360
--        伤害
ATTACK = 220

--        分割线 ~~~~~~~~~~~


--       几种技能 1.随机效果 2.蓝色炸弹 3.彩虹
RAND_SKIL = 1
BLUE_BUMB = 2
RAINBOW_SKIL = 3

--        分割线 ~~~~~~~~~~~



local ScoreLayer = class("ScoreLayer", function()
    return display.newNode()
end)

scoreTable = {
    {count = 3,score = 45},
    {count = 4,score = 60},
    {count = 5,score = 75},
    {count = 6,score = 135},
    {count = 7,score = 160},
    {count = 8,score = 180},
    {count = 9,score = 270},
    {count = 10,score = 300},
    {count = 11,score = 330},
    {count = 12,score = 360},
    
}

function ScoreLayer:ctor()
   
	self.score = 0
	self.energy = 0
	
end
--        有些问题在 能量汇聚
function ScoreLayer:energyCollect(comboNum,breakNum)
    if self.energy <= 100  then
        self.energy = self.energy + breakNum - 2 
        else
        self.energy = 100
       end
end

function ScoreLayer:countBreakScore(breakNum)
--    收集能量
    self:energyCollect(breakNum)
--    统计分数
    if breakNum <= 12 and comboNum > 0 then
        for key, var in pairs(scoreTable) do
            if var.count == breakNum then
                self.score = self.score + math.modf(var.score * (1 + comboNum * 0.1 ))
            end
        end
    else 
        --        特殊情况，最大值
        self.score = self.score + math.modf(M_B_SCORE * (1 + comboNum * 0.1 ))
    end
end

function ScoreLayer:countMonsterScore(HitNum)
--        没确定数值 ，  看宏定义
   self.score  = self.score + HitNum * ATTACK
--   做测试用于返回 正常不需要
   return self.score
end
    
--    技能分数
function ScoreLayer:SkillScore(skilType)
    	if skilType == RAND_SKIL then
    		self.score = self.score + 2000
    elseif skilType == RAINBOW_SKIL or skilType == BLUE_BUMB then
    		self.score = self.score + 5000
    	end
 end


return ScoreLayer