--[[
  File: plugins.lua
  Description: This file needed for loading plugin list into lazy.nvim and loading plugins
  Info: Use <zo> and <zc> to open and close foldings
  See: https://github.com/folke/lazy.nvim
]]

require "helpers/globals"

return {
  -- dashboard, start page {{{
  {
    "glepnir/dashboard-nvim",
    event = 'VimEnter',
    config = function()
      require "extensions.dashboard"
    end,
    dependencies = "nvim-tree/nvim-web-devicons"
  },
  --}}}

  -- Mason {{{
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      -- the config is called inside LSP config to call it in the right order
    end
  },
  -- }}}

  -- LSP config {{{
  {
    'neovim/nvim-lspconfig',
    lazy = false,
    dependencies = "williamboman/mason.nvim",
    config = function()
      require "extensions.lspconfig"
    end
  },
  --}}}

  -- murmur (highlight words) {{{
  {
    "nyngwang/murmur.lua",
    lazy = false,
    config = function()
      require "extensions.murmur"
    end
  },
  --}}}

  -- nvim-tree (file browser) {{{
  {
    "nvim-tree/nvim-tree.lua",
    config = function ()
      require "extensions.tree"
    end
  },
  -- }}}

  -- Telescope {{{
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "ahmedkhalf/project.nvim",
    },
    config = function()
      require "extensions.telescope"
    end
  },
  -- }}}

  -- CMP {{{
  {
    'hrsh7th/nvim-cmp',
    event = "InsertEnter",
    dependencies = {
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-emoji',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-nvim-lua',
      'zbirenbaum/copilot.lua',
      'zbirenbaum/copilot-cmp',
      'rafamadriz/friendly-snippets',
      'onsails/lspkind-nvim',
    },
    config = function()
      require "extensions.cmp"
    end
  },
  -- }}}

  -- autopairs {{{
  {
    'windwp/nvim-autopairs',
    config = function()
      require("nvim-autopairs").setup()
    end
  },
  -- }}}

  -- edit surroundings {{{
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = true,
  },
  -- }}}

  -- comments {{{
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },
  -- }}}

  -- find and replace {{{
  {
    'brooth/far.vim',
  },
  -- }}}

  -- neogit {{{
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "nvim-telescope/telescope.nvim", -- optional
      "sindrets/diffview.nvim",        -- optional
    },
    config = true
  },
  -- }}}

  -- git conflicts {{{
  {
    'akinsho/git-conflict.nvim',
    version = "*",
    config = true
  },
  -- }}}

  -- Git Signs{{{
  {
    'lewis6991/gitsigns.nvim',
    lazy = false,
    config = function()
      require "extensions.gitsigns"
    end
  },
  -- }}}

  -- sorting {{{
  {
    'sQVe/sort.nvim',
    config = true,
  },
  -- }}}

  -- Trouble {{{
  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require "extensions.trouble"
    end,
  },
  -- }}}

  -- show due dates {{{
  {
    'NFrid/due.nvim',
    config = true,
  },
  -- }}}

  -- toggle terminal {{{
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
      require "extensions.toggleterm"
    end
  },
  -- }}}

  -- TreeSitter {{{
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require "extensions.treesitter"
    end
  },
  -- }}}

  -- vimwiki {{{
  {
    'vimwiki/vimwiki',
    init = function()
      require "extensions.vimwiki"
    end
  },
  --}}}

  -- persisted.nvim (session management) {{{
  {
    "olimorris/persisted.nvim",
    dependencies = {
      {
        "tiagovla/scope.nvim",
        lazy = false,
      }
    },
    config = function()
      require "extensions.persisted"
    end
  },
  --}}}

  -- lualine {{{
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require "extensions.lualine"
    end
  },
  -- }}}

  -- bufferline {{{
    {
      "akinsho/bufferline.nvim",
      version = "*",
      dependencies = "nvim-tree/nvim-web-devicons",
      config = function()
        require "extensions.bufferline"
      end
    },
  -- }}}

  -- bufdel {{{
  {
    "ojroques/nvim-bufdel",
  },
  --}}}

  -- devicons {{{
  {
    "nvim-tree/nvim-web-devicons",
    lazy = false,
    config = function()
      require "extensions.devicons"
    end
  },
  -- }}}

  -- scroll-bar {{{
  {
    "petertriho/nvim-scrollbar",
    lazy = false,
    config = function()
      require "extensions.scrollbar"
    end
  },
  -- }}}

  -- preview colors {{{
  {
    "norcalli/nvim-colorizer.lua",
  },
  -- }}}

  -- which key {{{
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function ()
      require "extensions.which-key"
    end
  },
  --}}}

  -- Theme: Catppuccin {{{
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    config = function ()
      require "extensions.colorscheme.catppuccin"
    end
  },
  -- }}}

  -- lazygit {{{
  {
    'kdheepak/lazygit.nvim',
    lazy = false,
    config = function()
      require "extensions.lazygit"
    end
  },
  -- }}}
}

-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=0
