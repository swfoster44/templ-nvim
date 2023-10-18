local function string_to_table(input_string)
    local line_table = {}
    print("starting")
    for line in string.gmatch(input_string, "([^\n]*)\n") do
        print("Line: " .. line)
        table.insert(line_table, line)
    end

    print(vim.inspect(line_table))
end

local str = [[

int main() {
    return 0;
}


]]

string_to_table(str)
