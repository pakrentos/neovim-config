local highlight_group = 'ColorColumn'

-- Retrieve the highlight information
local hl_info = vim.api.nvim_get_hl_by_name(highlight_group, true)

-- Retrieve the background color
local bg_color = string.format('#%06x', hl_info.background)

require("scrollbar").setup({
    handle = {
        color = bg_color,
    }
})