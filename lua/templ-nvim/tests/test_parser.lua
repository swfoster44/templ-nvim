local Parser = require("templ-nvim.parser")
local settings = require("templ-nvim.default_settings")


local parser = Parser:new(settings)
-- print("\n" .. parser.var_pattern .. "\n")

local function test_get_var_name()
    local var_name = parser:get_var_name("@test_var@")
    assert(var_name == "test_var")
    -- print("\n" .. var_name .. "\n")
end

test_get_var_name()
