
local M = {}



local templ_nvim = vim.api.nvim_create_augroup(
    "TEMPL_NVIM",
    { clear = true }
)


--vim.api.nvim_create_autocmd({ "BufNewFile", }, {
--
--    group = templ_nvim,
--
--    callback = function(ev)
--        local config = require("templ-nvim.configuration")
--        local Parser = require("templ-nvim.parser")
--        print("\n", config.settings.templates['.h'], "\n")
--        local parser = Parser:new(config.settings)
--        local contents = parser.parse(ev.file)
--        -- print(contents)
--    end
--
--})


return M
