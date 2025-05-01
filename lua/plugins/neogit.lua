return {
    '1Naim/neogit', -- change when snacks.picker integration is merged
    lazy = true,
    dependencies = {
        "nvim-lua/plenary.nvim",         -- required
        "sindrets/diffview.nvim",        -- optional - Diff integration

        'folke/snacks.nvim' -- snacks.picker
    },
    config = function()
        local neogit = require 'neogit'
        local naim_neogit = vim.api.nvim_create_augroup('naim_neogit', {})
        neogit.setup {
            integrations = {
                diffview = true,
                snacks = true,
            },
        }

        autocmd('BufWinEnter', {
            group = naim_neogit,
            pattern = '*',
            callback = function()
                if vim.bo.ft ~= 'NeogitStatus' then
                    return
                end

                local bufnr = vim.api.nvim_get_current_buf()
                local opts = { buffer = bufnr, remap = false }
                vim.keymap.set('n', '<leader>gp', ':Neogit pull<CR>', opts)
                vim.keymap.set('n', '<leader>gP', ':Neogit push<CR>', opts)
                vim.keymap.set('n', '<leader>ga', ':Neogit add -u<CR>', opts)
                vim.keymap.set('n', '<leader>gc', ':Neogit commit -s<CR>', opts)
            end,
        })
    end,
    keys = {
        {
            '<leader>gg', ':Neogit<CR>', desc = '[G]it [G]ud'
        },
    },
}

