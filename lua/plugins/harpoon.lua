local function generate_harpoon_picker()
    local file_paths = {}
    for _, item in ipairs(require('harpoon'):list().items) do
        table.insert(file_paths, {
            text = item.value,
            file = item.value
        })
    end
    return file_paths
end

return {
    'ThePrimeagen/harpoon',
    lazy = true,
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    keys = {
        {
            '<leader>ha', function() require('harpoon'):list():add() end,
            desc = 'Add file to harpoon list'
        },
        { '<leader>1', function() require('harpoon'):list():select(1) end },
        { '<leader>2', function() require('harpoon'):list():select(2) end },
        { '<leader>3', function() require('harpoon'):list():select(3) end },
        { '<leader>4', function() require('harpoon'):list():select(4) end },
        { '<leader>sa', function()
            require('snacks').picker {
                finder = generate_harpoon_picker,
                win = {
                    input = {
                        keys = {
                            ["dd"] = { "harpoon_delete", mode = { "n", "x" } }
                        }
                    },
                    list = {
                        keys = {
                            ["dd"] = { "harpoon_delete", mode = { "n", "x" } }
                        }
                    },
                },
                actions = {
                    harpoon_delete = function(picker, item)
                        local to_remove = item or picker:selected()
                        table.remove(require('harpoon'):list().items, to_remove.idx)
                        picker:find({
                            refresh = true -- refresh picker after removing values
                        })
                    end
                },
            } end
        },
    }
}
