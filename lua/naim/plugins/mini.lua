return {
    {
        'echasnovski/mini.statusline',
        version = '*',
        config = function()
            local statusline = require 'mini.statusline'

            statusline.setup { use_icons = true }

            require('mini.statusline').section_location = function()
                return '%2l:%-2v'
            end

        end
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
