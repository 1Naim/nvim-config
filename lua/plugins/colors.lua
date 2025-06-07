return {
    {
        'Shatur/neovim-ayu',
        priority = 1000,
        lazy = false,
        enabled = false,
        config = function()
            local colors = require 'ayu.colors'
            colors.generate() -- Pass `true` to enable mirage

            require('ayu').setup {
                overrides = function()
                    return {
                        Comment = { fg = colors.comment, italic = false },
                        LineNr = { fg = colors.comment },
                        BlinkCmpMenuSelection = {
                            fg = colors.accent,
                            reverse = true,
                        },
                        NonText = { fg = '#3C424E' },
                        -- Transparency
                        Normal = { bg = 'None' },
                        NormalFloat = { bg = 'none' },
                        SignColumn = { bg = 'None' },
                        Folded = { bg = 'None' },
                        FoldColumn = { bg = 'None' },
                        CursorLine = { bg = 'None' },
                        CursorColumn = { bg = 'None' },
                        VertSplit = { bg = 'None' },
                    }
                end,
            }
            vim.cmd.colorscheme 'ayu-dark'
        end,
    },
    {
        'zenbones-theme/zenbones.nvim',
        dependencies = 'rktjmp/lush.nvim',
        lazy = false,
        priority = 1000,
        enabled = true,
        init = function()
            vim.g.duckbones = {
                italic_comments = false,
                transparent_background = true,
            }
        end,
        config = function()
            vim.api.nvim_create_autocmd({ 'ColorScheme' }, {
                pattern = 'duckbones',
                callback = function(params)
                    local base = require(params.match)
                    vim.api.nvim_set_hl(0, 'Constant', { fg = base.Constant.fg.hex })
                    vim.api.nvim_set_hl(0, 'Boolean', { fg = base.Boolean.fg.hex })
                    vim.api.nvim_set_hl(0, 'Number', { fg = base.Number.fg.hex })
                end,
            })
            vim.cmd.colorscheme 'duckbones'
        end,
    },
}
