vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-a>', '<C-u>zz')
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Split navigation goodness
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- greatest remap ever -- le primeagen
vim.keymap.set('x', 'p', [["_dP]])

vim.keymap.set('i', '<C-c>', '<Esc>')

vim.keymap.set('n', '<leader>r', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true })

-- Tab navigation
vim.keymap.set('n', '<C-n>', '<cmd>tabnew<CR>')
vim.keymap.set('n', '<C-x>', '<cmd>tabclose<CR>')
vim.keymap.set('n', '<A-PageUp>', '<C-PageUp>')
vim.keymap.set('n', '<A-PageDown>', '<C-PageDown>')


-- Short handle for executing shell commands
vim.keymap.set('n', '<C-s>', ':!')

-- Shortcut for selecting all lines
vim.keymap.set('n', '<leader>a', 'ggVG')

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
