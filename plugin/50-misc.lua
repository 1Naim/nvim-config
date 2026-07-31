MINI_NOW_IF_ARGS(function() PACK_ADD { 'https://github.com/lambdalisue/vim-suda' } end)

MINI_LATER(function() vim.cmd 'packadd nvim.undotree' end)

MINI_LATER(function()
    vim.api.nvim_create_autocmd('TextYankPost', {
        desc = 'Highlight when yanking (copying) text',
        callback = function() vim.hl.on_yank() end,
    })
end)

-- Delete trailing whitespaces on write
MINI_LATER(function()
    vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
        pattern = { '*' },
        callback = function()
            local blacklist = {
                ['gitsendemail'] = true,
                ['diff'] = true,
                ['gitcommit'] = true,
            }
            local ft = vim.bo.filetype
            if blacklist[ft] then return end

            local save_cursor = vim.fn.getpos '.'
            pcall(function() vim.cmd [[%s/\s\+$//e]] end)
            vim.fn.setpos('.', save_cursor)
        end,
    })
end)

MINI_NOW(
    function()
        vim.filetype.add {
            pattern = {
                ['.*git/config'] = 'gitconfig',
            },
            filename = {
                ['PKGBUILD'] = 'sh',
            },
        }
    end
)
