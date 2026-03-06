MINI_NOW_IF_ARGS(function() PACK_ADD { 'https://github.com/lambdalisue/vim-suda' } end)

MINI_LATER(function() vim.cmd 'packadd nvim.undotree' end)

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    callback = function() vim.hl.on_yank() end,
})

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufReadPost' }, {
    desc = 'Automatically set the root directory',
    callback = function()
        local kernel_root = '/mnt/Media/CachyOS-Git/linux/main'
        local file = vim.api.nvim_buf_get_name(0)

        if vim.startswith(file, kernel_root) then
            vim.cmd('lcd ' .. vim.fn.fnameescape(kernel_root))
            return
        end

        require('mini.misc').setup_auto_root()
    end,
})
