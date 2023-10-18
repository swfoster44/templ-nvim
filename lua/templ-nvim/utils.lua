local M = {}

function M.string_to_table(input_string)
    local line_table = {}
    for line in string.gmatch(input_string, "([^\n]*)\n") do
        table.insert(line_table, line)
    end

    return line_table
end

return M
