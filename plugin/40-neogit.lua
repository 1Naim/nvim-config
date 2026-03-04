mini_later(function()
    pack_add({
        'https://github.com/nvim-lua/plenary.nvim',
        'https://github.com/NeogitOrg/neogit',
    })

    require('neogit').setup {
        integrations = { mini_pick = true }
    }

    vim.keymap.set('n', '<leader>gg', vim.cmd.Neogit)
end)
