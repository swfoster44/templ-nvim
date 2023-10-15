local M = {}


local FSPath = require("templ-nvim.fspath")


M.c_header_guard = function(file_basename)
    local guard_val = string.gsub(file_basename, "(%w+)(%.)(%w+)", "_%1_%3_")
    guard_val = string.upper(guard_val)

    local header_guard = {}
    header_guard.start = "#ifndef " .. guard_val .. "\n#define " .. guard_val .. "\n\n"
    header_guard.stop = "#endif\n"
    return header_guard
end


M.c_include_header = function(file_basename)
    return string.gsub(file_basename, "(%w+%.)(c)", "#include %1h\n")
end

return M
