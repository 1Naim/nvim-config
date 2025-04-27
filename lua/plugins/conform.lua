return {
    'stevearc/conform.nvim',
    event = { 'BufWritepre' },
    cmd = { 'ConformInfo' },
    opts = {
        notify_on_error = false,
        formatters_by_ft = {
            c = { 'clang-format' },
            cpp = { 'clang-format' },
            lua = { 'stylua' },
        },
    },
    keys = {
        { '<leader>cf', function()
            require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[C]onform [F]ormat' }
    },
}
