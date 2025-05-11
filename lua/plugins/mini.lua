return {
    'echasnovski/mini.nvim',
    config = function()
        require('mini.icons').setup()
        MiniIcons.mock_nvim_web_devicons()
        MiniIcons.tweak_lsp_kind()

        -- statusline
        local statusline = require 'mini.statusline'
        statusline.setup { use_icons = true }
        statusline.section_location = function()
            return '%2l:%-2v'
        end

        -- tabline
        require('mini.tabline').setup()

        -- Indent scope
        require('mini.indentscope').setup {
            draw = { animation = require('mini.indentscope').gen_animation.none() },
            symbol = '│',
        }

        -- git
        require('mini.git').setup()
        require('mini.diff').setup {
            view = {
                style = 'sign',
                signs = { add = '+', change = '~', delete = '_' },
            },
        }

        -- textobjects
        require('mini.ai').setup()
        require('mini.surround').setup()

        -- autochdir
        require('mini.misc').setup_auto_root()
    end,
}
