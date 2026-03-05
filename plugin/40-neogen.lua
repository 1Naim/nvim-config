MINI_LATER(function()
    PACK_ADD({ 'https://github.com/danymat/neogen' })

    require('neogen').setup()

    vim.keymap.set('n', '<leader>ng', vim.cmd.Neogen)
end)
