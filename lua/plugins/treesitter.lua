local function enable_treesitter(args)
    local buf = args.buf
    local filetype = args.match

    -- you need some mechanism to avoid running on buffers that do not
    -- correspond to a language (like oil.nvim buffers), this implementation
    -- checks if a parser exists for the current language
    local language = vim.treesitter.language.get_lang(filetype) or filetype
    if not vim.treesitter.language.add(language) then
        return
    end

    -- Disable for files that are too big
    local max_filesize = 1024 * 1024 * 25 -- 25MB
    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
    if ok and stats and stats.size > max_filesize then
        vim.notify('Disabling treesitter because filesize is too large', vim.log.levels.WARN, { title = 'Treesitter' })
        return true
    end

    -- replicate `fold = { enable = true }`
    -- vim.wo.foldmethod = 'expr'
    -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

    -- replicate `highlight = { enable = true }`
    vim.treesitter.start(buf, language)

    -- replicate `indent = { enable = true }`
    -- vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
end

return {
    {
        'nvim-treesitter/nvim-treesitter',
        branch = 'main',
        event = { 'BufReadPost', 'BufWritePost', 'BufNewFile', 'VeryLazy' },
        lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
        build = ':TSUpdate',
        config = function()
            local languages = {
                'bash', 'fish',
                'c', 'cpp', 'kconfig', 'make',
                'gitcommit', 'html', 'markdown', 'markdown_inline',
                'lua', 'java', 'python', 'r', 'rust'
            }

            require('nvim-treesitter').install(languages)
            vim.treesitter.language.register('bash', 'PKGBUILD')

            vim.api.nvim_create_autocmd('FileType', {
                group = vim.api.nvim_create_augroup('treesitter.setup', {}),
                callback = enable_treesitter,
            })
        end,
    },
    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        branch = 'main',
        event = 'VeryLazy',
    },
}
