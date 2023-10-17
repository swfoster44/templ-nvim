local Parser = require("templ-nvim.parser")
local buffer = "test.h"

local function test_parse()
    local conf = require("templ-nvim.configuration")
    conf.settings.vars.name = "Dufus"
    local p = Parser:new(conf.settings)
    
    print("settings in test: " .. p.settings.globals.var_pattern  .. "\n")

    local contents = p:parse(buffer)
    assert(contents ~= "")
    print("contents: " ..  contents .. "\n")
end

test_parse()
