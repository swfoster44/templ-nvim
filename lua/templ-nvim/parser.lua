local M = {}


local function set_var_pattern(settings)
    return string.format("%s(.+)%s", settings.var_marker, settings.var_marker)
end


function M:new(settings)
    local o = { var_pattern = set_var_pattern(settings) }
    setmetatable(o, self)
    self.__index = self
    return o;
end


function M:get_var_name(var)
    return string.match(var, self.var_pattern)
end


function M:get_var_val(var_name)
    return self.settings.vars[var_name]
end


return M
