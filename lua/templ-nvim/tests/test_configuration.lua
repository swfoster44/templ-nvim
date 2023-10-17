local function test_conf()
    local conf = require("templ-nvim.configuration")

    local name = "dufus"
    local var_marker = "--"
    local my_var = "hello"
    local my_num = 10

    local new_settings = {
        globals = {
            ['my_var'] = my_var,
            ['var_marker'] = var_marker
        },

        templates = {
            ['my_var'] = my_var,
            ['my_num'] = my_num
        },

        vars = {
            ['name'] = name
        }
    }

    local settings = conf.setup(new_settings)

    assert(settings.vars['name'] == name)
    assert(settings.templates['my_var'] == my_var)
    assert(settings.templates['my_num'] == nil)
    assert(settings.globals['my_var'] == nil)
    assert(settings.globals['var_marker'] == var_marker)
end

test_conf()
