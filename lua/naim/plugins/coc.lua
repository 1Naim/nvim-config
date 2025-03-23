return {
    'neoclide/coc.nvim',
    branch = 'release',
    config = function()
        local keyset = vim.keymap.set

        -- Autocomplete
        function _G.check_back_space()
            local col = vim.fn.col('.') - 1
            return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
        end

        local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }

        -- Use Tab for completion
        keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
        keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

        -- Accept completion with Enter
        keyset("i", "<CR>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

        -- Trigger completion manually
        keyset("i", "<C-space>", "coc#refresh()", { silent = true, expr = true })

        -- Navigation for diagnostics
        keyset("n", "[g", "<Plug>(coc-diagnostic-prev)", { silent = true })
        keyset("n", "]g", "<Plug>(coc-diagnostic-next)", { silent = true })

        -- GoTo definitions
        keyset("n", "gd", "<Plug>(coc-definition)", { silent = true })
        keyset("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
        keyset("n", "gi", "<Plug>(coc-implementation)", { silent = true })
        keyset("n", "gr", "<Plug>(coc-references)", { silent = true })

        -- Show documentation
        function _G.show_docs()
            local cw = vim.fn.expand('<cword>')
            if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
                vim.cmd('help ' .. cw)
            elseif vim.fn.eval('coc#rpc#ready()') then
                vim.fn.CocActionAsync('doHover')
            else
                vim.cmd('!' .. vim.o.keywordprg .. ' ' .. cw)
            end
        end
        keyset("n", "K", function() _G.show_docs() end, { silent = true })

        -- Symbol renaming (Fixed)
        keyset("n", "<leader>rn", function() vim.fn.CocActionAsync('rename') end, { silent = true })
    end
}

