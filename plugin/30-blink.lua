MINI_NOW_IF_ARGS(function()
    PACK_ADD {
        'https://github.com/Kaiser-Yang/blink-cmp-git',
        {
            src = 'https://github.com/saghen/blink.cmp',
            version = vim.version.range '1.x',
        },
    }

    require('blink.cmp').setup {
        keymap = { preset = 'default' },

        appearance = {
            -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
            -- Adjusts spacing to ensure icons are aligned
            nerd_font_variant = 'mono',
        },

        -- (Default) Only show the documentation popup when manually triggered
        completion = {
            documentation = { auto_show = false },
            menu = {
                draw = {
                    components = {
                        kind_icon = {
                            text = function(ctx)
                                local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
                                return kind_icon
                            end,
                            -- (optional) use highlights from mini.icons
                            highlight = function(ctx)
                                local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
                                return hl
                            end,
                        },
                        kind = {
                            -- (optional) use highlights from mini.icons
                            highlight = function(ctx)
                                local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
                                return hl
                            end,
                        },
                    },
                },
            },
        },

        -- Default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
        sources = {
            default = { 'git', 'lsp', 'path', 'buffer' },
            providers = {
                git = {
                    module = 'blink-cmp-git',
                    name = 'Git',
                    enabled = function()
                        return vim.tbl_contains(
                            { 'gitsendemail', 'gitcommit', 'markdown' },
                            vim.bo.filetype
                        )
                    end,
                    opts = {
                        commit = {
                            enable = function()
                                if vim.fn.getcwd(0, 0) == '/mnt/Media/CachyOS-Git/linux/main' then
                                    return false
                                end

                                local utils = require('blink-cmp-git.utils')
                                return utils.is_inside_git_repo()
                            end,

                            -- Insert first 12 hash and commit title
                            get_insert_text = function(item)
                                return item:match('commit ([^\n]*)'):sub(1, 12)
                                    .. ' ("'
                                    .. item:match '\n\n%s*([^\n]*)'
                                    .. '")'
                            end,
                        },
                    },
                },
            },
        },

        signature = { enabled = true },
    }
end)
