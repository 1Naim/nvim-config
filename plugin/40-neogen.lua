mini_later(function()
    pack_add({ 'https://github.com/danymat/neogen' })

    require('neogen').setup()

    vim.keymap.set('n', '<leader>ng', vim.cmd.Neogen)
end)
