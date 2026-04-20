MINI_LATER(function()
    PACK_ADD { 'https://github.com/stevearc/conform.nvim' }

    require('conform').setup {
        formatters_by_ft = {
            c = { 'clang-format' },
            cpp = { 'clang-format' },
            lua = { 'stylua' },
            rust = { "rustfmt", lsp_format = "fallback" },
        },
    }

    vim.keymap.set({ 'n', 'v' }, '<leader>cf', function()
        require('conform').format { async = true, lsp_format = 'fallback' }
    end)
end)
