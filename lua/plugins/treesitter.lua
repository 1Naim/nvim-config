return {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPost', 'BufWritePost', 'BufNewFile', 'VeryLazy' },
    lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    opts = {
        ensure_installed = {
            'bash',
            'c',
            'cpp',
            'diff',
            'lua',
            'markdown',
            'markdown_inline',
            'rust',
            'vim',
        },
        auto_install = true,
        sync_install = false,
        highlight = {
            enable = true,
            disable = function(_, buf)
                local max_filesize = 1024 * 1024 * 25 -- 25MB
                local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                if ok and stats and stats.size > max_filesize then
                    vim.notify('Disabling treesitter because filesize is too large', vim.log.levels.WARN, { title = 'Treesitter' })
                    return true
                end
            end,
            additional_vim_regex_highlighting = false,
        },
        indent = { enable = false },

        vim.treesitter.language.register('bash', 'PKGBUILD'),
    },
}
