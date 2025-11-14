return {
    'NMAC427/guess-indent.nvim',
    event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
    opts = {
        on_space_options = { -- A table of vim options when spaces are detected
            ["expandtab"] = true,
            ["tabstop"] = 8, -- Make sure tab characters are always 8 columns
            ["softtabstop"] = "detected",
            ["shiftwidth"] = "detected",
        },
    },
}
