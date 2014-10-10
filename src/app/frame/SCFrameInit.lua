local SCFrameInit = {}
local FRAME_MODULE_NAME = string.sub(..., 1, -12)

require(FRAME_MODULE_NAME ..".scui")
require(FRAME_MODULE_NAME ..".scact")
require(FRAME_MODULE_NAME ..".scd")
return SCFrameInit
