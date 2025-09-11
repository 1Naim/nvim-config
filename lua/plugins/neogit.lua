return {
    'NeogitOrg/neogit',
    lazy = true,
    dependencies = {
        "nvim-lua/plenary.nvim",         -- required
        'nvim-mini/mini.nvim' -- mini.pick
    },
    opts = {
        integrations = { mini_pick = true }
    },
    keys = {
        {
            '<leader>gg', ':Neogit<CR>', desc = '[G]it [G]ud'
        },
    },
}

