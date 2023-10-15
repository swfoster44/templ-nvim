local FSPath = require("templ-nvim.fspath")
local templates = require("templ-nvim.templates")

local M = {}



local templ_nvim = vim.api.nvim_create_augroup(
    "TEMPL_NVIM",
    { clear = true }
)


vim.api.nvim_create_autocmd({ "BufNewFile", }, {
    pattern = { "*.c", "*.h" },

    group = templ_nvim,

    callback = function(ev)
        local fspath = FSPath:new(ev.file)
        templates.c_header_guard(fspath:basename())
    end

})


return M
