return {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = 'v0.14.2',
    opts = {
        keymap = {
            preset = 'enter',

            ['<S-TAB>'] = { 'select_prev', 'fallback' },
            ['<TAB>'] = { 'select_next', 'fallback' },
        },

        appearance = {
            nerd_font_variant = 'mono',
        },
    },
}
