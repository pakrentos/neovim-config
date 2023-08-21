--[[
  File: lualine.lua
  Description: lualine plugin configuration
  See: https://github.com/nvim-lualine/lualine.nvim
]]

local function session_name()
    return require('possession.session').session_name or ''
end

require('lualine').setup({
    sections = {
        lualine_a = {session_name},
        lualine_c = {{
            'filename',
            path = 3
        }}
    },
    options = {
        globalstatus = true,
        component_separators = {'', ''},
        section_separators = {'', ''}
    }
})
