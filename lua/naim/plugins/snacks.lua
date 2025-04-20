return {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        explorer = {
            enabled = true,
            replace_netrw = true,
        },
        dashboard = { enabled = true },
        indent = {
            enabled = true,
            animate = { enabled = false },
            scope = { hl = 'IndentBlanklineContextChar' },
        },
        notifier = { enabled = true },
        picker = { enabled = true },
    },
    keys = {
        { '<leader>sh', function() Snacks.picker.help() end, desc = '[S]earch [H]elp' },
        { '<leader>sk', function() Snacks.picker.keymaps() end, desc = '[S]earch [K]eymaps' },
        { '<leader>ff', function() Snacks.picker.smart() end, desc = '[F]ind [F]iles' },
        { '<leader>fn', function()
            Snacks.picker.smart({ cwd = vim.fn.stdpath("config") })
        end, desc = '[F]ind [N]eovim Config' },
        { '<leader>gf', function() Snacks.picker.git_files() end, desc = '[G]it [F]iles' },
        { '<leader>ss', function() Snacks.picker.pickers() end, desc = '[S]earch [S]elect Snacks' },
        { '<leader>sw', function() Snacks.picker.grep_word() end, desc = '[S]earch current [W]ord' },
        { '<leader>sg', function() Snacks.picker.grep() end, desc = '[S]earch by [G]rep' },
        { '<leader>sd', function() Snacks.picker.diagnostics() end, desc = '[S]earch [D]iagnostics' },
        { '<leader>sr', function() Snacks.picker.resume() end, desc = '[S]earch [R]esume' },
        { '<leader>s.', function() Snacks.picker.recent() end, desc = '[S]earch Recent Files ("." for repeat)' },
        { '<leader><leader>', function() Snacks.picker.buffers() end, desc = '[ ] Find existing buffers' },
        { '<leader>ee', function() Snacks.explorer() end, desc = '[E]xecute [E]xplorer' },

    },
}
