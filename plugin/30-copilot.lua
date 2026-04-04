MINI_NOW_IF_ARGS(function()
    PACK_ADD { 'https://github.com/zbirenbaum/copilot.lua' }
    require('copilot').setup {
        suggestion = { enabled = false },
        panel = { enabled = false },
    }
end)
