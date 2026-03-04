-- Set <space> as the leader key
-- See `:help mapleader`
-- NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '

-- Make line numbers default
vim.o.number = true
vim.o.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

-- Save undo history
vim.o.undofile = true

-- No swap
vim.o.swapfile = false

-- Disable backups
vim.o.backup = false

-- Disable wrap
vim.o.wrap = false

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.o.list = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 12

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

-- Indentation settings
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

-- Mark the 80th column
vim.o.colorcolumn = '80'
vim.o.textwidth = 80

-- Search options
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- suda smart edit
vim.g.suda_smart_edit = 1

mini_later(function()
    -- See :help vim.diagnostic.Opts
    -- Diagnostic Config & Keymaps
    vim.diagnostic.config {
        update_in_insert = false,
        severity_sort = true,
        float = { border = 'rounded', source = 'if_many' },
        underline = { severity = vim.diagnostic.severity.ERROR },

        -- Can switch between these as you prefer
        virtual_text = true, -- Text shows up at the end of the line
        virtual_lines = false, -- Teest shows up underneath the line, with virtual lines

        -- Auto open the float, so you can easily read the errors when jumping with `[d` and `]d`
        jump = { float = true },
    }
end)
