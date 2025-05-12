return {
    'danymat/neogen',
    lazy = true,
    opts = {},
    keys = {
        { '<leader>nf', function() require('neogen').generate({ type = 'func'}) end },
        { '<leader>nc', function() require('neogen').generate({ type = 'class'}) end },
        { '<leader>ni', function() require('neogen').generate({ type = 'file'}) end },
        { '<leader>nt', function() require('neogen').generate({ type = 'type'}) end },
    },
}
