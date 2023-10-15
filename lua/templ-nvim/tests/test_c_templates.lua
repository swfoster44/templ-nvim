local templ = require("templ-nvim.templates")

local header = "test.h"
local csrc = "test.c"

local function test_c_header_guard()
    local header_guard = templ.c_header_guard(header)
    -- print(header_guard.start)
    -- print(header_guard.stop)
    --
    assert(
        header_guard.start == "#ifndef _TEST_H_\n#define _TEST_H_\n\n",
        "start header failed"
    )

    assert(header_guard.stop == "#endif\n", "stop header failed")
end


local function test_c_include_header()
    local include = templ.c_include_header(csrc)
    print(include)

    assert(
        include == "#include " .. header .. "\n",
        "include header failed"
    )
end


test_c_header_guard()
test_c_include_header()
