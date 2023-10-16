
local FSPath = {}


function FSPath:new(filepath)
    local o = { pathstr = filepath }
    setmetatable(o, self)
    self.__index = self
    return o;
end

function FSPath:basename()
    return vim.fs.basename(self.pathstr)
end

function FSPath:extension()
    return string.match(self:basename(), "[.].*$")
end

function FSPath:joinpath(path)
    return self.pathstr .. "/" .. path
end

return FSPath
