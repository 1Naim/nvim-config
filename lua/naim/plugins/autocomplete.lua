return {
    'saghen/blink.cmp',
    version = '1.*',
    opts = {
        keymap = {
            preset = 'enter',

            ['<S-TAB>'] = { 'select_prev', 'fallback' },
            ['<TAB>'] = { 'select_next', 'fallback' },
        },
        appearance = {
            nerd_font_variant = 'mono',
        },

        signature = { enabled = true },
    },
}
