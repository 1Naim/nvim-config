local colors = require('ayu.colors')
colors.generate() -- Pass `true` to enable mirage

require('ayu').setup({
    overrides = function()
    return {
        Comment = { fg = colors.comment }, -- Disable italics for comments
        LineNr = { fg = colors.comment }, -- Make relative line numbers readable
    }
    end
})
