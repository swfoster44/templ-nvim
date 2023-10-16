local Parser = require("templ-nvim.parser")
local buffer = "test.h"

local function test_parse()
    local settings = require("templ-nvim.default_settings")
    settings.vars.name = "Dufus"
    local p = Parser:new(settings)
    print("settings in test: " .. p.settings.globals.var_pattern  .. "\n")

    local contents = p:parse(buffer)
    print("contents: " ..  contents .. "\n")
end

test_parse()
