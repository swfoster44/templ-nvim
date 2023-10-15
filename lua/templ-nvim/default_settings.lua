local FSPath = require("templ-nvim.fspath")
local templates = require("templ-nvim.templates")

local config_path = vim.fn.stdpath("config")


local M = {

    globals = {
        template_dir = FSPath:new(config_path .. "/templates").pathstr,
        var_marker = "@",
        var_pattern = "",
    },

    vars = {
        ['name'] = "",
        ['filename']= "",
        ['date'] = "",
        ['c_header_guard'] = templates.c_header_guard,
        ['c_include_header'] = templates.c_include_header
    },

    templates = {
        -- ['.c'] = "sources.templ",
        -- ['.l.c'] = "lexer.templ",
        -- ['main.c'] = "main.templ",
        ['.h'] = "header.templ"
    }

}


return M
