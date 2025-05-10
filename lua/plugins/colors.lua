return {
    'Shatur/neovim-ayu',
    priority = 1000,
    lazy = false,
    config = function()
        local colors = require 'ayu.colors'
        colors.generate() -- Pass `true` to enable mirage

        require('ayu').setup {
            overrides = function()
                return {
                    Comment = { fg = colors.comment, italic = false },
                    LineNr = { fg = colors.comment },
                    BlinkCmpMenu = { fg = colors.comment },
                    BlinkCmpMenuBorder = { fg = colors.accent },
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
    end,
}
