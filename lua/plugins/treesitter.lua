local function install_and_start()
  -- Auto-install and start treesitter parser for any buffer with a registered filetype
  vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
    callback = function(event)
      local bufnr = event.buf
      local filetype = vim.api.nvim_get_option_value("filetype", { buf = bufnr })

      -- Skip if no filetype
      if filetype == "" then
        return
      end

      -- Get parser name based on filetype
      local parser_name = vim.treesitter.language.get_lang(filetype) -- might return filetype (not helpful)
      if not parser_name then
        return
      end
      -- Try to get existing parser (helpful check if filetype was returned above)
      local parser_configs = require("nvim-treesitter.parsers")
      if not parser_configs[parser_name] then
        return -- Parser not available, skip silently
      end

      local parser_installed = pcall(vim.treesitter.get_parser, bufnr, parser_name)

      if not parser_installed then
        -- If not installed, install parser synchronously
        require("nvim-treesitter").install({ parser_name }):wait(30000)
      end

      -- let's check again
      parser_installed = pcall(vim.treesitter.get_parser, bufnr, parser_name)

      if parser_installed then
        -- Start treesitter for this buffer
        local max_filesize = 1024 * 1024 * 25 -- 25MB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(bufnr))
        if ok and stats and stats.size > max_filesize then
            vim.notify('Disabling treesitter because filesize is too large', vim.log.levels.WARN, { title = 'Treesitter' })
            return true
        end
        vim.treesitter.start(bufnr, parser_name)
      end
    end,
  })
end

return {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    event = { 'BufReadPost', 'BufWritePost', 'BufNewFile', 'VeryLazy' },
    lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
    build = ':TSUpdate',
    config = function()
        vim.treesitter.language.register('bash', 'PKGBUILD')
        install_and_start()
    end,
}
