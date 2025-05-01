return {
    '1Naim/neogit', -- change when snacks.picker integration is merged
    lazy = true,
    dependencies = {
        "nvim-lua/plenary.nvim",         -- required
        "sindrets/diffview.nvim",        -- optional - Diff integration

        'folke/snacks.nvim' -- snacks.picker
    },
    opts = {
        integrations = {
            diffview = true,
            snacks = true,
        }
    },
    keys = {
        {
            '<leader>gg', ':Neogit<CR>', desc = '[G]it [G]ud'
        },
    },
}

