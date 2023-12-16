require "helpers/globals"
require "helpers/keyboard"

g.mapleader = ' ' -- Use Space, like key for alternative hotkeys

-- prevent moving cursor when yanking (copying)
vm('y', 'ygv<Esc>')

-- Telescope {{{
nm('<Leader><Leader>', '<cmd>Telescope find_files theme=ivy<CR>')
nm('<Leader>s', '<cmd>Telescope persisted<CR>')
nm('<Leader>ff', '<cmd>Telescope live_grep theme=ivy<CR>')
nm('<Leader>l', '<cmd>Telescope current_buffer_fuzzy_find<CR>')
nm('<leader>gd', '<cmd>Telescope lsp_definitions theme=cursor<CR>')
nm('<leader>gi', '<cmd>Telescope lsp_implementations theme=cursor<CR>')
nm('<leader>gr', '<cmd>Telescope lsp_references theme=cursor<CR>')
nm('<leader>xx', '<cmd>Telescope diagnostics theme=ivy<CR>')
nm('<leader>j', '<cmd>Telescope<CR>')
nm('<leader>k', '<cmd>Telescope keymaps<CR>')
nm('<leader>t', '<cmd>Telescope lsp_document_symbols<CR>')
-- }}}

-- Trouble {{{
nm('<leader>x', '<cmd>TroubleToggle<CR>') -- Show all problems in project (with help of LSP)
-- }}}

-- sorting {{{
nm('gs', '<Cmd>Sort<CR>')
vm('gs', '<Esc><Cmd>Sort<CR>')
-- }}}

-- git {{{
nm("<Leader>hu", "<cmd>Gitsigns reset_hunk<CR>")
nm("<Leader>hp", "<cmd>Gitsigns preview_hunk<CR>")
-- }}}

-- session {{{
nm('<leader>sc', '<cmd>SessionClose<CR><cmd>Dashboard<CR>') -- Close session
-- }}}

-- nvim-tree {{{
nm('<Tab>', '<cmd>NvimTreeToggle<CR>') -- Toggle file explorer
-- }}}

-- bufferline {{{
nm('<C-l>', '<cmd>BufferLineCycleNext<CR>')
nm('<C-h>', '<cmd>BufferLineCyclePrev<CR>')
nm('<C-t>o', '<cmd>BufferLineCloseLeft<CR><cmd>BufferLineCloseRight<CR>')
-- }}}

-- bufdel {{{
nm('<leader>q', '<cmd>BufDel<CR>')
-- }}}

-- terminal {{{
cmd [[
    " exit from terminal mode with Esc
    tnoremap <S-Esc> <C-\><C-n>
    " navigate windows with alt+h/j/k/l
    tnoremap <A-h> <C-\><C-n><C-w>h
    tnoremap <A-j> <C-\><C-n><C-w>j
    tnoremap <A-k> <C-\><C-n><C-w>k
    tnoremap <A-l> <C-\><C-n><C-w>l
    nnoremap <A-h> <C-w>h
    nnoremap <A-j> <C-w>j
    nnoremap <A-k> <C-w>k
    nnoremap <A-l> <C-w>l
]]
-- }}}

-- comments {{{
-- line
vim.keymap.set("n", "<leader>/", function()
  require('Comment.api').toggle.linewise.current()
end)

-- selection
local esc = vim.api.nvim_replace_termcodes(
  '<ESC>', true, false, true
)

vim.keymap.set('x', '<leader>/', function()
  vim.api.nvim_feedkeys(esc, 'nx', false)
  require('Comment.api').toggle.linewise(vim.fn.visualmode())
end)
-- }}}

-- vimwiki {{{
nm('<leader>tt', '<cmd>VimwikiToggleListItem<CR>')
-- }}}

-- insert mode mappings {{{
cmd [[
    " to move in insert mode
    " move cursour word left
    inoremap <A-Left> <C-o>b
    " move cursour word right
    inoremap <A-Right> <Esc>ea
    " delete word left
    inoremap <A-Bs> <C-w>
    " delete word right
    inoremap <A-S-Bs> <C-o>dw
    " move cursor left
    inoremap <C-h> <Left>
    " move cursor left
    inoremap <C-l> <Right>
    " move cursor down
    inoremap <C-j> <Down>
    " move cursor up
    inoremap <C-k> <Up>
    " move cursor to line start
    inoremap <C-S-h> <C-o>^
    " move cursor to line end
    inoremap <C-S-l> <C-o>$
    " delete everything after cursor until the line end
    inoremap <C-S-u> <C-o><S-d>
    " undo
    inoremap <C-z> <C-o>u
    " redo
    inoremap <C-S-z> <C-o><C-r>
    " save buffer
    inoremap <C-s> <C-o>:w<Enter>
    " paste buffer
    inoremap <C-v> <C-o>P
    " scroll up/down
    inoremap <C-u> <C-o><C-u>
    inoremap <C-d> <C-o><C-d>
]]
-- }}}

-- neovide {{{
if g.neovide then
  g.neovide_padding_top = 0
  g.neovide_padding_bottom = 0
  g.neovide_padding_right = 0
  g.neovide_padding_left = 0
  g.neovide_scroll_animation_length = 0.6
  g.neovide_cursor_animation_length = 0.03
  g.neovide_cursor_animate_command_line = false
  g.neovide_fullscreen = true
  g.neovide_hide_mouse_when_typing = true
  g.neovide_confirm_quit = true

  opt.linespace = 1
  opt.guifont = "Iosevka_NFM_Light:h13"

  cmd [[
        " save buffer
        inoremap <D-s> <C-o>:w<CR>
        " undo/redo
        inoremap <D-z> <C-o>u
        inoremap <D-y> <C-o><C-r>

        " copy line (empty selection)
        inoremap <D-c> <C-o>yy
        nnoremap <D-c> yy
        " cut line (empty selection)
        inoremap <D-x> <C-o>dd
        nnoremap <D-x> dd
        " paste
        inoremap <D-v> <Esc>pa
        nnoremap <D-v> p
        " copy selection
        vnoremap <D-c> y
        " paste into selected area
        vnoremap <D-v> p

        " move to start/end of the line
        inoremap <D-Left> <C-o>^
        inoremap <D-Right> <C-o>$
        " remove to the start/end of the line
        inoremap <D-Backspace> <Esc>v^c
        inoremap <D-Delete> <Esc>vEc
        " move line down/up
        inoremap <A-Down> <C-o>dd<C-o>p
        inoremap <A-Up> <C-o>dd<C-o>k<C-o>P
        " copy line down/up
        inoremap <A-S-Down> <C-o>yy<C-o>p
        inoremap <A-S-Up> <C-o>yy<C-o>P
        " insert line above
        inoremap <D-Enter> <C-o>O
        " go to the start of the file
        inoremap <D-Up> <C-o>gg
        " go to the end of the file
        inoremap <D-Down> <C-o>G
        " toggle comment
        inoremap <D-/> <C-o>:lua require('Comment.api').toggle.linewise.current()<CR>
        " select current line
        inoremap <D-l> <C-o>V
        " split vertically
        inoremap <D-Bslash> <C-o>:vsplit<CR><C-o><C-w>l
        " close window
        inoremap <D-w> <C-o>:BufDel<CR>
        " create empty buffer
        inoremap <D-n> <C-o>:enew<CR>
    ]]
end
-- }}}

-- LSP {{{
nm('[d', 'vim.diagnostic.goto_prev')
nm(']d', 'vim.diagnostic.goto_next')

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
api.nvim_create_autocmd('LspAttach', {
  group = api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = {
      noremap = true,
      silent = true,
      buffer = bufnr
    }
    local opts = {
      buffer = ev.buf
    }
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, bufopts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set({'v', 'n'}, '<leader>ca', vim.lsp.buf.code_action, bufopts)
  end
})
-- }}}

-- LazyGit {{{
nm('<leader>gg', '<cmd>LazyGit<CR>')
-- }}}

-- rust-tools {{{
nm('<leader>rh', '<cmd>RustHoverActions<CR>')
-- }}}

-- nvim-dap {{{
nm('<leader>db', '<cmd>DapToggleBreakpoint<CR>')
nm('<leader>dt', '<cmd>DapTermintate<CR>')
nm('<leader>di', '<cmd>DapStepInto<CR>')
nm('<leader>do', '<cmd>DapStepOut<CR>')
nm('<leader>dn', '<cmd>DapStepOver<CR>')
nm('<leader>dr', '<cmd>DapRestartFrame<CR>')
nm('<leader>dr', '<cmd>DapRestartFrame<CR>')
nm('<leader>du', '<cmd>lua require("dapui").toggle()<CR>')
-- }}} 

-- bookmarks {{{
nm("mm", "<cmd>lua require('bookmarks').bookmark_toggle()<CR>") -- add or remove bookmark at current line
nm("mi", "<cmd>lua require('bookmarks').bookmark_ann()<CR>") -- add or edit mark annotation at current line 
nm("mc", "<cmd>lua require('bookmarks').bookmark_clean()<CR>") -- clean all marks in local buffer
nm("mn", "<cmd>lua require('bookmarks').bookmark_next()<CR>") -- jump to next mark in local buffer        
nm("mp", "<cmd>lua require('bookmarks').bookmark_prev()<CR>") -- jump to previous mark in local buffer    
nm("ml", "<cmd>lua require('bookmarks').bookmark_list()<CR>") -- show marked file list in quickfix window 
nm("<leader>m", "<cmd>Telescope bookmarks list<CR>")
-- }}}

-- misc {{{
-- Reload shortcuts
nm('<leader>rk', '<cmd>lua dofile(vim.env.HOME .. "/.config/nvim/lua/keybindings.lua")<CR>')
-- }}}

-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=0
