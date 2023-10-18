local config = require("templ-nvim.configuration")
local parser = require("templ-nvim.parser")

local M = {}


local templ_nvim = vim.api.nvim_create_augroup(
    "TEMPL_NVIM",
    { clear = true }
)


local function new_file_callback(ev, settings)
    local contents = parser.parse(ev.file, settings)
    if not contents then return nil end
    vim.api.nvim_buf_set_lines(0, 0, -1, false, contents)
end


function M.setup(user_settings)
    local settings = config.setup(user_settings)

    vim.api.nvim_create_autocmd({ "BufNewFile", }, {

        group = templ_nvim,

        callback = function(ev)
            new_file_callback(ev, settings)
        end
    })
end

return M
