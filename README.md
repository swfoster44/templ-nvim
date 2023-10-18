# templ-nvim

templ-nvim is a neovim plugin for creating file templates.


[![Lua](https://img.shields.io/badge/Lua-blue.svg?style=for-the-badge&logo=lua)](http://www.lua.org)
[![Neovim](https://img.shields.io/badge/Neovim%200.5+-green.svg?style=for-the-badge&logo=neovim)](https://neovim.io)

## Installation

#### pack
>use('swfoster44/templ-nvim')


## Configuration/Usage

### Defaults
```
    require('templ-nvim').setup( {

        globals = {
            template_dir = '~/.config/nvim/templates',
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

### Globals
>The globals section contains the options that determine how templ will operate.
>
>* **template_dir:** The default is the root of the neovim config folder. templ
>has no preference on where it is located.
>
>* **var_marker:** This is the string that identifies variables in the .templ 
>file that will be replaced. Variable names should be bracketed by the marker.
>For example, @name@ will be replaced by the value in vars['name'].
>
>To use '%' as the var_marker, it must be escaped. templ uses lua patterns so 
>globals['var_marker']="%%".

### Vars
>The vars section contains all the variables available to a template file. 
>Names can use alphanumeric characters and the _. Values can be a string or a 
>function that returns a string. Any vars not in the settings will be ignored
>and copied as is.


### Templates
>The templates extension maps file patterns to files. Keys can contain single 
>extensions, multiple extensions (.l.c) or whole file names. Values are 
>template filenames located in the template_dir.
>
>Template files can also contain plain text which will be copied over to the
>new buffer as layed out in the template file.


## License

[MIT](https://choosealicense.com/licenses/mit/)
