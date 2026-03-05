MINI_LATER(function()
    PACK_ADD { 'https://github.com/MeanderingProgrammer/render-markdown.nvim' }

    require('render-markdown').setup {
        completions = { lsp = { enabled = true } },
        latex = { enabled = false },
        yaml = { enabled = false },
    }
end)
