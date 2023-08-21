--[[
  File: settings.lua
  Description: Base settings for neovim
  Info: Use <zo> and <zc> to open and close foldings
]]

require "helpers/globals"

-- Set associating between turned on plugins and filetype
cmd[[filetype plugin on]]

-- Tabs {{{
opt.expandtab = true                -- Use spaces by default
opt.shiftwidth = 4                  -- Set amount of space characters, when we press "<" or ">"
opt.tabstop = 4                     -- 1 tab equal 2 spaces
opt.smartindent = true              -- Turn on smart indentation. See in the docs for more info
opt.autoindent = true               -- Copy indent from current line, over to the new one
opt.smarttab = true                 -- Insert tabs on the start of the line according to shiftwidth
opt.softtabstop = 0                 -- Set amount of space characters, when we press "<Tab>"
-- }}}

-- Editing {{{
opt.spelllang = "en_us,ru_ru"       -- Set spell language
opt.wrap = false                    -- Disable word wrap
-- }}}

-- UI {{{
opt.termguicolors = true            -- Enable 24-bit RGB colors
opt.background = "dark"             -- Set dark background
opt.cursorline = true               -- Highlight current line
opt.number = true                   -- Show line numbers
opt.laststatus = 3                  -- Single status line
opt.signcolumn = "yes"              -- Always show sign column
opt.fillchars = ""                  -- Remove split line
cmd[[set colorcolumn=+1]]           -- Show vertical line width line
-- }}}

-- Optimizations {{{
-- opt.lazyredraw = true            -- Don't redraw while executing macros (good performance config)
opt.ttyfast = true                  -- Faster redraw
opt.swapfile = false                -- Disable swap files
opt.updatetime = 300                -- Faster completion
-- }}}

-- Clipboard {{{
opt.clipboard = 'unnamedplus'       -- Use system clipboard
opt.fixeol = false                  -- Turn off appending new line in the end of a file
-- }}}

-- Search {{{
opt.ignorecase = true               -- Ignore case if all characters in lower case
opt.joinspaces = false              -- Join multiple spaces in search
opt.smartcase = true                -- When there is a one capital letter search for exact match
opt.showmatch = true                -- Highlight search instances
-- }}}

-- Window {{{
opt.splitbelow = true               -- Put new windows below current
opt.splitright = true               -- Put new vertical splits to right
-- }}}

-- Wild Menu {{{
opt.wildmenu = true
opt.wildmode = "longest:full,full"
-- }}}

-- File Type Specific {{{
-- General
   -- Disable comments on pressing Enter
cmd[[au FileType * setlocal formatoptions-=cro]]
-- sh
cmd[[au FileType sh setlocal tw=80]]
-- md
cmd[[au FileType markdown setlocal tw=80]]
cmd[[au FileType markdown setlocal spell]]
-- wgsl
cmd[[au FileType wgsl setlocal tw=80]]
cmd[[au BufNewFile,BufRead *.wgsl set filetype=wgsl]]
-- vimwiki
cmd[[au FileType vimwiki setlocal nonumber]]
cmd[[au FileType vimwiki setlocal wrap]]
cmd[[au FileType vimwiki setlocal tw=80]]
cmd[[au FileType vimwiki setlocal spell]]
-- c/c++
cmd[[au FileType c setlocal tw=80]]
cmd[[au FileType cpp setlocal tw=80]]
-- js/jsx/ts/tsx
cmd[[au FileType js setlocal tw=100]]
cmd[[au FileType javascript setlocal tw=100]]
cmd[[au FileType jsx setlocal tw=100]]
cmd[[au FileType ts setlocal tw=100]]
cmd[[au FileType typescript setlocal tw=100]]
cmd[[au FileType tsx setlocal tw=100]]
-- py
cmd[[au FileType py setlocal tw=80]]
cmd[[au FileType python setlocal tw=80]]
-- rust
cmd[[au FileType rust setlocal tw=100]]
-- lua
cmd[[au FileType lua setlocal tw=80]]
-- yaml
cmd[[au FileType yaml tabstop=2]]
cmd[[au FileType yaml shiftwidth=2]]
-- git
cmd[[autocmd FileType gitcommit,gitrebase,gitconfig set bufhidden=delete]]
-- }}}

-- Default Plugins {{{
local disabled_built_ins = {
    -- "netrw",
    -- "netrwPlugin",
    -- "netrwSettings",
    -- "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    -- "spellfile_plugin",
    "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
    g["loaded_" .. plugin] = 1
end
-- }}}

-- vim: tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=1
