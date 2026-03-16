MINI_NOW_IF_ARGS(function()
    PACK_ADD { 'https://github.com/neovim/nvim-lspconfig' }

    local servers = {
        bashls = {
            settings = {
                bashIde = {
                    shellcheckArguments = '-e SC2034,SC2154',
                },
            },
            filetypes = { 'bash', 'sh', 'PKGBUILD' },
        },
        clangd = {
            cmd = {
                'clangd',
                '--clang-tidy',
                '--completion-style=detailed',
                '-j=12',
                '--header-insertion-decorators',
                '--pretty',
                '--enable-config',
            },
        },
        lua_ls = {
            on_init = function(client)
                if client.workspace_folders then
                    local path = client.workspace_folders[1].name
                    if
                        path ~= vim.fn.stdpath 'config'
                        and (
                            vim.uv.fs_stat(path .. '/.luarc.json')
                            or vim.uv.fs_stat(path .. '/.luarc.jsonc')
                        )
                    then
                        return
                    end
                end

                client.config.settings.Lua =
                    vim.tbl_deep_extend('force', client.config.settings.Lua, {
                        runtime = {
                            version = 'LuaJIT',
                            path = { 'lua/?.lua', 'lua/?/init.lua' },
                        },
                        workspace = {
                            checkThirdParty = false,
                            -- NOTE: this is a lot slower and will cause issues when working on your own configuration.
                            --  See https://github.com/neovim/nvim-lspconfig/issues/3189
                            library = vim.api.nvim_get_runtime_file('', true),
                        },
                    })
            end,
            settings = {
                Lua = {
                    completion = {
                        callSnippet = 'Replace',
                    },
                },
            },
        },
        pyrefly = {},
        rust_analyzer = {},
    }

    for server, config in pairs(servers) do
        vim.lsp.config(server, config)
        vim.lsp.enable(server)
    end
end)
