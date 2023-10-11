local FSPath = require("fspath")

local M = {}

local config_path = vim.fn.stdpath("config")
local templ_dir = FSPath:new(config_path .. "/templates")

local settings = {
    [".h"] = "header.h",
    [".c"] = "source.c",
    ["main.c"] = "main.c"
}


