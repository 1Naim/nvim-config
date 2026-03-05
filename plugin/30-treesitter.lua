local languages = {
    'bash', 'fish', 'c',
    'cpp', 'kconfig', 'make',
    'gitcommit', 'html', 'lua',
    'markdown', 'python', 'rust',
    'query', 'vim', 'vimdoc'
}

MINI_NOW_IF_ARGS(function()
    PACK_ADD({
        'https://github.com/nvim-treesitter/nvim-treesitter',
        'https://github.com/nvim-treesitter/nvim-treesitter-textobjects',
    })

    require('nvim-treesitter').install(languages)
    vim.treesitter.language.register('bash', 'PKGBUILD')

    vim.api.nvim_create_autocmd('FileType', {
        group = vim.api.nvim_create_augroup('treesitter.setup', {}),
        callback = function(args)
            local buf = args.buf
            local filetype = args.match

            -- you need some mechanism to avoid running on buffers that do not
            -- correspond to a language (like oil.nvim buffers), this implementation
            -- checks if a parser exists for the current language
            local language = vim.treesitter.language.get_lang(filetype)
            if not language then
                return
            end

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
            -- still broken
            -- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
    })

    vim.api.nvim_create_autocmd('PackChanged', {
        desc = 'Handle nvim-treesitter updates',
        group = vim.api.nvim_create_augroup('nvim-treesitter-pack-changed-update-handler', { clear = true }),
        callback = function(event)
            if event.data.kind == 'update' and event.data.spec.name == 'nvim-treesitter' then
                vim.notify('nvim-treesitter updated, running TSUpdate...', vim.log.levels.INFO)
                ---@diagnostic disable-next-line: param-type-mismatch
                local ok = pcall(vim.cmd, 'TSUpdate')
                if ok then
                    vim.notify('TSUpdate completed successfully!', vim.log.levels.INFO)
                else
                    vim.notify('TSUpdate command not available yet, skipping', vim.log.levels.WARN)
                end
            end
        end,
    })
end)
