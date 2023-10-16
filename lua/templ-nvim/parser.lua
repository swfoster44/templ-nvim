local FSPath = require('templ-nvim.fspath')


local M = {}


local function set_var_pattern(settings)
    return string.format(
        "%s([%%w_]+)%s",
        settings.globals.var_marker, settings.globals.var_marker)
end

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

function M:new(settings)
    settings.globals.var_pattern = set_var_pattern(settings)

    local o = {}
    setmetatable(o, self)
    self.__index = self

    self.settings = settings
    return o;
end

function M:parse(buffer)
    local buffer_path = FSPath:new(buffer)
    local templ_name = template_file_name(buffer_path, self.settings)
    if not templ_name then return nil end

    local templ_path = template_path(templ_name, self.settings)
    if not templ_path then return nil end

    local templ_handle = io.open(templ_path, 'r')
    if not templ_handle then return nil end

    local contents = templ_handle:read("*all")

    for v in string.gmatch(contents, self.settings.globals.var_pattern) do

        local replace = self.settings.vars[v]
        if type(replace) == "function"
        then
            replace = replace(buffer_path, self.settings)
        end

        if replace then
            contents = string.gsub(
                contents,
                self.settings.globals.var_marker .. v .. self.settings.globals.var_marker,
                replace
            )
        end
    end

    templ_handle:close()

    return contents
end

return M
