return {
    'saghen/blink.cmp',
    version = '1.*',
    event = 'VimEnter',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    dependencies = { 'nvim-mini/mini.nvim' }, -- mini.icons
    opts = {
        keymap = {
            preset = 'none',

            ['<S-TAB>'] = { 'select_prev', 'fallback_to_mappings' },
            ['<TAB>'] = { 'select_next', 'fallback_to_mappings' },
            ['<Up>'] = { 'select_prev', 'fallback' },
            ['<Down>'] = { 'select_next', 'fallback' },
            ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
            ['<C-e>'] = { 'hide' },
            ['<CR>'] = { 'select_and_accept', 'fallback' },
            ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
            ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
            ['<C-n>'] = { 'snippet_forward', 'fallback' },
            ['<C-p>'] = { 'snippet_backward', 'fallback' },
            ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
        },
        appearance = {
            nerd_font_variant = 'mono',
        },

        completion = {
            -- <C-space> to show documentation
            documentation = { auto_show = false, auto_show_delay_ms = 500 },
            menu = {
                draw = {
                    components = {
                        kind_icon = {
                            text = function(ctx)
                                local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
                                return kind_icon
                            end,
                            highlight = function(ctx)
                                local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
                                return hl
                            end,
                        },
                        kind = {
                            highlight = function(ctx)
                                local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
                                return hl
                            end,
                        },
                    },
                },
            },
        },

        sources = {
            default = { 'lsp', 'path', 'snippets' },
            providers = {
                path = {
                    opts = {
                        get_cwd = function(_)
                            return vim.fn.getcwd()
                        end,
                    },
                },
            },
        },

        signature = { enabled = true },
    },
}
