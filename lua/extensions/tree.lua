local function on_attach(bufnr)
    local api = require('nvim-tree.api')

    local function opts(desc)
        return {
            desc = 'nvim-tree: ' .. desc,
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true
        }
    end

    api.config.mappings.default_on_attach(bufnr)
    -- Mappings removed via:
    --   remove_keymaps
    --   OR
    --   view.mappings.list..action = ""
    --
    -- The dummy set before del is done for safety, in case a default mapping does not exist.
    --
    -- You might tidy things by removing these along with their default mapping.
    vim.keymap.set('n', '<Tab>', '', {
        buffer = bufnr
    })
    vim.keymap.del('n', '<Tab>', {
        buffer = bufnr
    })
    vim.keymap.set('n', '<2-RightMouse>', '', {
        buffer = bufnr
    })
    vim.keymap.del('n', '<2-RightMouse>', {
        buffer = bufnr
    })

    -- Mappings migrated from view.mappings.list
    --
    -- You will need to insert "your code goes here" for any mappings with a custom action_cb
    vim.keymap.set('n', '<2-LeftMouse>', api.tree.change_root_to_node, opts('CD'))

end

require("nvim-tree").setup({
    view = {
        side = "left"
    },
    on_attach = on_attach
})
