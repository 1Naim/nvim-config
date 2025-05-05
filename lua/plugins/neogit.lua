return {
    'NeogitOrg/neogit',
    lazy = true,
    dependencies = {
        "nvim-lua/plenary.nvim",         -- required
        'folke/snacks.nvim' -- snacks.picker
    },
    opts = {
        integrations = { snacks = true }
    },
    keys = {
        {
            '<leader>gg', ':Neogit<CR>', desc = '[G]it [G]ud'
        },
    },
}

