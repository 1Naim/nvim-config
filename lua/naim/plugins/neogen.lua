return {
    'danymat/neogen',
    config = function()
        require("neogen").setup()

        local opts = { noremap = true, silent = true }
        vim.api.nvim_set_keymap("n", "<Leader>cd", ":lua require('neogen').generate()<CR>", opts)
    end
}
