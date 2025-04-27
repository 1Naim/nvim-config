return {
    'danymat/neogen',
    config = function()
        require('neogen').setup()

        local opts = { noremap = true, silent = true }
        local keymap_set = vim.api.nvim_set_keymap
        keymap_set('n', '<Leader>nf', ":lua require('neogen').generate({ type = 'func' })<CR>", opts)
        keymap_set('n', '<Leader>nc', ":lua require('neogen').generate({ type = 'class' })<CR>", opts)
        keymap_set('n', '<Leader>ni', ":lua require('neogen').generate({ type = 'file' })<CR>", opts)
        keymap_set('n', '<Leader>nt', ":lua require('neogen').generate({ type = 'type' })<CR>", opts)
    end,
}
