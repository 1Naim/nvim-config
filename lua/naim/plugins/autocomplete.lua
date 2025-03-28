return {
    'saghen/blink.cmp',
    version = '1.*',
    event = 'VimEnter',
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

        signature = { enabled = true },
    },
}
