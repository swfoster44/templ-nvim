local FSPath = require("templ-nvim.fspath")
local templates = require("templ-nvim.templates")

local config_path = vim.fn.stdpath("config")

local M = {}


function M.setup(new_settings)
    local settings = {

        globals = {
            template_dir = FSPath:new(config_path .. "/templates").pathstr,
            var_marker = "@",
        },

        vars = {
            ['name'] = "",
            ['filename'] = "",
            ['date'] = "",
            ['c_header_guard'] = templates.c_header_guard,
            ['c_include_header'] = templates.c_include_header
        },

        templates = {
            ['.c'] = "sources.templ",
            ['.l.c'] = "lexer.templ",
            ['main.c'] = "main.templ",
            ['.h'] = "header.templ"
        }

    }


    local function update_globals(global_settings)
        if not global_settings then return nil end

        for i, v in pairs(global_settings) do
            if settings.globals[i] then
                settings.globals[i] = v
            end
        end
    end


    local function update_vars(vars_settings)
        if not vars_settings then return nil end

        for i, v in pairs(vars_settings) do
            settings.vars[i] = v
        end
    end


    local function update_templates(templates_settings)
        if not templates_settings then return nil end

        for i, v in pairs(templates_settings) do
            if type(v) == "string" then
                settings.templates[i] = v
            end
        end
    end


    update_globals(new_settings.globals)
    update_vars(new_settings.vars)
    update_templates(new_settings.templates)


    if settings.globals.var_marker then
        local vm = settings.globals.var_marker
        settings.globals.var_pattern = string.format("%s([%%w_]+)%s", vm, vm)
    end

    return settings
end

return M
