# templ-nvim

templ-nvim is a neovim plugin for creating file templates.

## Installation

### pack
use('swfoster44/templ-nvim')


## Configuration

#### defualts
```
    settings = {

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

    }
```

## Contributing


## License

[MIT](https://choosealicense.com/licenses/mit/)
