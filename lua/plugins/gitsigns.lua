function git_my_lines()
    -- Properly link GitSigns highlights to default Git colors
    vim.api.nvim_set_hl(0, 'GitSignsAdd', { link = 'DiffAdd' })
    vim.api.nvim_set_hl(0, 'GitSignsAddLn', { link = 'DiffAdd' })
    vim.api.nvim_set_hl(0, 'GitSignsAddNr', { link = 'DiffAdd' })

    vim.api.nvim_set_hl(0, 'GitSignsChange', { link = 'DiffChange' })
    vim.api.nvim_set_hl(0, 'GitSignsChangeLn', { link = 'DiffChange' })
    vim.api.nvim_set_hl(0, 'GitSignsChangeNr', { link = 'DiffChange' })

    vim.api.nvim_set_hl(0, 'GitSignsDelete', { link = 'DiffDelete' })
    vim.api.nvim_set_hl(0, 'GitSignsDeleteLn', { link = 'DiffDelete' })
    vim.api.nvim_set_hl(0, 'GitSignsDeleteNr', { link = 'DiffDelete' })

    vim.api.nvim_set_hl(0, 'GitSignsTopdelete', { link = 'DiffDelete' })
    vim.api.nvim_set_hl(0, 'GitSignsTopdeleteLn', { link = 'DiffDelete' })
    vim.api.nvim_set_hl(0, 'GitSignsTopdeleteNr', { link = 'DiffDelete' })

    vim.api.nvim_set_hl(0, 'GitSignsChangedelete', { link = 'DiffChange' })
    vim.api.nvim_set_hl(0, 'GitSignsChangedeleteLn', { link = 'DiffChange' })
    vim.api.nvim_set_hl(0, 'GitSignsChangedeleteNr', { link = 'DiffChange' })
end

return {
    'lewis6991/gitsigns.nvim',
    opts = {
        signs = {
            add = { text = '+' },
            change = { text = '~' },
            delete = { text = '_' },
            topdelete = { text = '‾' },
            changedelete = { text = '~' },
        },
        on_attach = function()
            git_my_lines()  -- Run only after gitsigns loads
        end,
    },
}
