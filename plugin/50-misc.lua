MINI_NOW_IF_ARGS(function() PACK_ADD { 'https://github.com/lambdalisue/vim-suda' } end)

MINI_LATER(function() vim.cmd 'packadd nvim.undotree' end)

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    callback = function() vim.hl.on_yank() end,
})

-- [[ Create user commands ]]
-- See `:h nvim_create_user_command()` and `:h user-commands`

-- Create a command `:GitBlameLine` that print the git blame for the current line
vim.api.nvim_create_user_command('GitBlameLine', function()
    local line_number = vim.fn.line '.' -- Get the current line number. See `:h line()`
    local filename = vim.api.nvim_buf_get_name(0)
    print(vim.system({ 'git', 'blame', '-L', line_number .. ',+1', filename }):wait().stdout)
end, { desc = 'Print the git blame for the current line' })
