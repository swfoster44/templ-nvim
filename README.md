# templ-nvim

templ-nvim is a neovim plugin for creating file templates.

## Installation

### pack
use('swfoster44/templ-nvim')


## Configuration

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

>The  globals section contains the options that determine how templ will operate.
>
>* **template_dir:** The default is the root of the neovim config folder. templ
>has no preference on where it is located.
>
>* **var_marker:** This is the string that identifies variables in the .templ 
>file that will be replaced. Variable names should be bracketed by the marker.
>For example, @name@ will be replaced by the value >in vars['name'].


>The vars section contains all the variables available to a template file. 
>names can use alphanumeric characters and the _. Values can be a string or a 
>function that returns a string.


>The templates extension maps file patterns to files. Keys can contain single 
>extensions, multiple extensions (.l.c) or whole file names. Values are 
>template filenames located in the template_dir.


## Contributing


## License

[MIT](https://choosealicense.com/licenses/mit/)
