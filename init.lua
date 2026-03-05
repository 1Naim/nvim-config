vim.pack.add { 'https://github.com/nvim-mini/mini.nvim' }

-- Loading helpers used to organize config into fail-safe parts. Example usage:
-- - `now` - execute immediately. Use for what must be executed during startup.
--   Like colorscheme, statusline, tabline, dashboard, etc.
-- - `later` - execute a bit later. Use for things not needed during startup.
-- - `now_if_args` - use only if needed during startup when Neovim is started
--
-- See also:
-- - `:h MiniMisc.safely()`
local misc = require 'mini.misc'
MINI_NOW = function(f) misc.safely('now', f) end
MINI_LATER = function(f) misc.safely('later', f) end
MINI_NOW_IF_ARGS = vim.fn.argc(-1) > 0 and MINI_NOW or MINI_LATER
PACK_ADD = vim.pack.add
