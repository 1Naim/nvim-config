return {
    {
        'echasnovski/mini.icons',
        version = '*',
        config = function()
            require('mini.icons').setup()
            MiniIcons.mock_nvim_web_devicons()
        end,
    },
    {
        'echasnovski/mini.statusline',
        version = '*',
        config = function()
            local statusline = require 'mini.statusline'

            statusline.setup { use_icons = true }

            require('mini.statusline').section_location = function()
                return '%2l:%-2v'
            end
        end,
    },
    {
        'echasnovski/mini.tabline',
        version = '*',
        opts = {},
    },
    {
        'echasnovski/mini.diff',
        version = '*',
        opts = {
            view = {
                style = 'sign',
                signs = { add = '+', change = '~', delete = '-' }
            },
        },
    },
    {
        'echasnovski/mini.ai',
        version = '*',
        opts = {},
    },
    {
        'echasnovski/mini.surround',
        version = '*',
        opts = {},
    },
}
