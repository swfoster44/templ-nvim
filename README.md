# templ-nvim

templ-nvim is a neovim plugin for creating file templates.

## Installation

### pack
use('swfoster44/templ-nvim')


## Configuration


```
    require('templ-nvim').setup( {

        globals = {
            template_dir = FSPath:new(config_path .. "/templates").pathstr,
            var_marker = "@",
        },

        vars = {
            ['name'] = "",
            ['filename'] = "",
            ['date'] = "",
            ['c_header_guard'] = templates.c_header_guard,
            ['c_include_header'] = templates.c_include_header
        },

        templates = {
            ['.c'] = "sources.templ",
            ['.l.c'] = "lexer.templ",
            ['main.c'] = "main.templ",
            ['.h'] = "header.templ"
        }

    })
```

This example shows the defaults templ uses. 


globals are the options that determine how templ will operate.
* **var_marker:** this is the string that identifies variables in the .templ file.

## Contributing


## License

[MIT](https://choosealicense.com/licenses/mit/)
