return {
    'Shatur/neovim-ayu',
    priority = 1000,
    lazy = false,
    config = function()
        local colors = require('ayu.colors')
        colors.generate() -- Pass `true` to enable mirage

        require('ayu').setup {
            overrides = function()
                return {
                    Comment = { fg = colors.comment },
                    LineNr = { fg = colors.comment },
                }
            end
        }

        vim.cmd.colorscheme("ayu-dark")
    end
}
