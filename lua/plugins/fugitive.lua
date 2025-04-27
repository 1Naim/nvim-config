return {
    'tpope/vim-fugitive',
    config = function()
        vim.keymap.set("n", "<leader>gg", vim.cmd.Git)
        local naim_fugitive = vim.api.nvim_create_augroup("naim_fugitive", {})

        local autocmd = vim.api.nvim_create_autocmd
        autocmd("BufWinEnter", {
            group = naim_fugitive,
            pattern = "*",
            callback = function()
                if vim.bo.ft ~= "fugitive" then
                    return
                end

                local bufnr = vim.api.nvim_get_current_buf()
                local opts = {buffer = bufnr, remap = false}
                vim.keymap.set("n", "<leader>gp", function()
                    vim.cmd.Git('pull')
                end, opts)

                vim.keymap.set("n", "<leader>gP", function()
                    vim.cmd.Git('push')
                end, opts)

                vim.keymap.set("n", "<leader>ga", ":Git add -u<CR>", opts)
                vim.keymap.set("n", "<leader>gc", ":Git commit -s<CR>", opts)
          end,
        })
    end
}
