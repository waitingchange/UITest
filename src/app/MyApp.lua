
require("config")
require("framework.init")
require("framework.cc.init")
require("framework.shortcodes")
require("src.app.frame.SCFrameInit")

local MyApp = class("MyApp", cc.mvc.AppBase)

function MyApp:ctor()
    MyApp.super.ctor(self)
end

function MyApp:run()
    cc.FileUtils:getInstance():addSearchPath("res/")
    self:enterScene("MainScene")
end

return MyApp
