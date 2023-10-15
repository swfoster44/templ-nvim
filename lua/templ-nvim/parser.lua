local FSPath = require('templ-nvim.fspath')


local M = {}


local function set_var_pattern(settings)
    return string.format(
        "%s(.+)%s",
        settings.globals.var_marker, settings.globals.var_marker)
end


function M:new(settings)
    settings.var_pattern = set_var_pattern(settings)
    local o = { settings = settings }
    setmetatable(o, self)
    self.__index = self
    return o;
end

function M:var_name(var)
    return string.match(var, self.settings.var_pattern)
end

function M:var_val(var_name)
    return self.settings.vars[var_name]
end

function M:template_file_name(fspath)
    local template_name = self.settings.templates[buffer_path:basename()]
    if not template_name then
        template_name = self.settings.templates[buffer_path:extension()]
    end

    return template_name
end

function M:template_path(name)
    local path = FSPath:new(self.settings.globals.template_dir)
    path = path:joinpath(name)
    return path
end

function M:parse(buffer)
    local buffer_path = FSPath:new(buffer)
    local template_name = self:template_file_name(buffer_path)
    if not template_name then return nil end

    local template_path = self:template_path(template_name)
    local handle = io.open(template_path, "r")
    if not handle then return nil end

    local contents = io.read(template_path, 'a')

    for v in string.gmatch(contents, self.settings.globals.var_pattern) do
        local value = self:var_val(self:var_name(v))
        -- need to account for header guard
        contents = string.gsub(contents, v, value)
    end

    handle:close()

    return contents
end

return M
