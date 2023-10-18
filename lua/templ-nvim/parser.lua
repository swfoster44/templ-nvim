local FSPath = require("templ-nvim.fspath")
local utils = require("templ-nvim.utils")

local M = {}


local function template_file_name(fspath, settings)
    local bn = fspath:basename()
    local template_name = settings.templates[bn]
    if not template_name then
        template_name = settings.templates[fspath:extension()]
    end

    return template_name
end

local function template_path(name, settings)
    local templ_dir_path = FSPath:new(settings.globals.template_dir)
    local path = templ_dir_path:joinpath(name)
    return path
end


local function template_var(var_name, settings)
    return settings.globals.var_marker .. var_name .. settings.globals.var_marker
end


function M.parse(buffer_file, settings)

    local buffer_path = FSPath:new(buffer_file)
    local templ_name = template_file_name(buffer_path, settings)
    if not templ_name then return nil end

    local templ_path = template_path(templ_name, settings)
    if not templ_path then return nil end

    local templ_handle = io.open(templ_path, 'r')
    if not templ_handle then return nil end

    local contents = templ_handle:read("*all")

    for v in string.gmatch(contents, settings.globals.var_pattern) do
        local replace = settings.vars[v]
        local var_type = type(replace)

        if var_type == "function" then
            local result = replace(buffer_path, settings)

            contents = string.gsub(
                contents, template_var(v, settings), result)

        elseif var_type == "string"  then
            contents = string.gsub(
                contents, template_var(v, settings), replace)
        end
    end

    templ_handle:close()

    return utils.string_to_table(contents)
end

return M
