--[[
  File: lualine.lua
  Description: lualine plugin configuration
  See: https://github.com/nvim-lualine/lualine.nvim
]]

local function cwd()
    local current_directory = vim.fn.getcwd()
    local directory_name = vim.fn.fnamemodify(current_directory, ":t")
    if directory_name ~= '' and directory_name ~= nil then
        directory_name = directory_name .. ' '
    end

    return directory_name
end

require('lualine').setup({
    sections = {
        lualine_b = {
            'branch',
            {
                'diff',
                on_click = function()
                    cmd [[DiffviewOpen]]
                end
            },
            {
                'diagnostics',
                on_click = function()
                    cmd [[Trouble]]
                end
            },
        },
        lualine_c = {
            {
                cwd,
                on_click = function()
                    cmd [[Telescope persisted]]
                end,
                color = {
                    gui = 'bold',
                }
            },
            {
                'filename',
                path = 1,
                on_click = function()
                    cmd [[Telescope find_files]]
                end
            },
            "location",
        },
        lualine_x = {},
        lualine_y = {
            {
                'filetype',
                on_click = function()
                    cmd [[Telescope filetypes]]
                end,
            },
        },
        lualine_z = {
            "progress",
        }
    },
    options = {
        globalstatus = true,
        component_separators = { '', '' },
        section_separators = { '', '' }
    },
})
