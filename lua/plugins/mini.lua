return {
    'nvim-mini/mini.nvim',
    config = function()
        require('mini.icons').setup()

        -- statusline
        local statusline = require 'mini.statusline'
        statusline.setup { use_icons = true }
        statusline.section_location = function()
            return '%2l:%-2v'
        end

        -- tabline
        require('mini.tabline').setup()

        -- netrw replacement
        require('mini.files').setup()
        vim.keymap.set('n', '<leader>e', MiniFiles.open)

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

        -- Picker
        require('mini.extra').setup()
        require('mini.pick').setup {
            mappings = {
                delete_char       = '<BS>',
                delete_char_right = '<Del>',
                delete_left       = '<C-e>',
                delete_word       = '<C-w>',

                move_down  = '<C-j>',
                move_start = '<C-g>',
                move_up    = '<C-k>',

                scroll_down  = '<C-d>',
                scroll_left  = '<C-h>',
                scroll_right = '<C-l>',
                scroll_up    = '<C-u>',
            },

            options = {
                content_from_bottom = true,
                use_cache = true,
            },
        }

        vim.keymap.set('n', '<leader>ff', function() MiniPick.builtin.files() end, { desc = 'Find Files' })
        vim.keymap.set('n', '<leader>fg', function() MiniPick.builtin.files({ tool = 'git'}) end, { desc = 'Git Files' })
        vim.keymap.set('n', '<leader>fn', function(_) MiniPick.builtin.files(_, { source = { cwd = vim.fn.stdpath 'config' }}) end, { desc = 'Neovim Config' })
        vim.keymap.set('n', '<leader>sh', function() MiniPick.builtin.help() end, { desc = 'Search Help' })
        vim.keymap.set('n', '<leader>sk', function() MiniExtra.pickers.keymaps() end, { desc = 'Search Keymaps' })
        vim.keymap.set('n', '<leader>sg', function() MiniPick.builtin.grep_live() end, { desc = 'Search by Grep' })
        vim.keymap.set('n', '<leader>sd', function() MiniExtra.pickers.diagnostic() end, { desc = 'Search Diagnostic' })
        vim.keymap.set('n', '<leader>sr', function() MiniPick.builtin.resume() end, { desc = 'Search Resume' })
        vim.keymap.set('n', '<leader>fr', function() MiniExtra.pickers.oldfiles() end, { desc = 'Recent Files' })
        vim.keymap.set('n', '<leader><leader>', function() MiniPick.builtin.buffers() end, { desc = 'Search Buffers' })

        -- textobjects
        require('mini.surround').setup()
        require('mini.ai').setup {
            custom_textobjects = {
                F = require('mini.ai').gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' }),
            },
        }

        -- notify
        require('mini.notify').setup()

        -- autochdir
        require('mini.misc').setup_auto_root()
    end,
}
