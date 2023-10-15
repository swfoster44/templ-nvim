local FSPath = require("templ-nvim.fspath")


local config_path = vim.fn.stdpath("config")


local M = {

    template_dir = FSPath:new(config_path .. "/templates").pathstr,

    var_marker = "@",

    vars = {
        ['name'] = "",
        ['file ']= true,
        ['date'] = true,
        ['date_pat'] = ""
    },

    templates = {
        ['.c'] = "sources.templ",
        ['.l.c'] = "lexer.templ",
        ['main.c'] = "main.templ",
        ['.h'] = "header.templ"
    }

}


return M
