local M = {}


local FSPath = require("templ-nvim.fspath")


M.c_header_guard = function(buffer_path)
    local guard_val = string.gsub(buffer_path:basename(), "(%w+)(%.)(%w+)", "_%1_%3_")
    guard_val = string.upper(guard_val)

    local header_guard  = "#ifndef " .. guard_val .. "\n#define " .. guard_val .. "\n\n"
    return header_guard
end


M.c_include_header = function(buffer_path)
    local header =  string.gsub(buffer_path:basename(), "(%w+%.)(c)", "%1h\n")
    return "#include " .. header
end

return M
