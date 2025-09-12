-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})

-- Delete trailing whitespaces on write
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
    pattern = { '*' },
    callback = function()
        local blacklist = {
            ['gitsendemail'] = true,
            ['diff'] = true,
            ['gitcommit'] = true,
        }
        local ft = vim.bo.filetype
        if blacklist[ft] then
            return
        end

        local save_cursor = vim.fn.getpos '.'
        pcall(function()
            vim.cmd [[%s/\s\+$//e]]
        end)
        vim.fn.setpos('.', save_cursor)
    end,
})

-- Use multi-block comments for c and cpp
vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'c', 'cpp' },
    callback = function()
        vim.bo.commentstring = '/* %s */'
    end,
})
