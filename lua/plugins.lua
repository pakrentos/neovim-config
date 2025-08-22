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
    dependencies = {
      "williamboman/mason.nvim",
      "folke/neodev.nvim",
    },
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
    config = function()
      require "extensions.tree"
    end
  },
  -- }}}

  -- Telescope {{{
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "ahmedkhalf/project.nvim",
      'nvim-telescope/telescope-fzf-native.nvim',
      "tomasky/bookmarks.nvim",
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        -- This will not install any breaking changes.
        -- For major updates, this must be adjusted manually.
        version = "^1.0.0",
      },
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
  -- {
  --   'vimwiki/vimwiki',
  --   init = function()
  --     require "extensions.vimwiki"
  --   end
  -- },
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
    config = function()
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
    config = function()
      require "extensions.colorscheme.catppuccin"
    end
  },
  -- }}}

  -- lazygit {{{
  {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  -- }}}

  -- nvim-dap {{{
  {
    -- TODO: add config script in extensions which checks presence of Mason's
    -- codelldb and cpptools DAP packages
    "mfussenegger/nvim-dap",
  },
  -- }}}

  -- nvim-dap-projects {{{
  {
    "ldelossa/nvim-dap-projects",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function()
      require "extensions.nvim-dap-projects"
    end
  },
  -- }}}

  -- nvim-luaref {{{
  {
    "milisims/nvim-luaref"
  },
  -- }}}

  -- neodev {{{
  {
    "folke/neodev.nvim",
    opts = {},
  },
  -- }}}

  -- nvim-dap-ui {{{
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      dapui.setup()
    end
  },
  -- }}}

  -- rust-tools {{{
  {
    "simrat39/rust-tools.nvim",
    dependencies = {
      "mfussenegger/nvim-dap",
      "williamboman/mason.nvim",
    },
    config = function()
      require "extensions.rust-tools"
    end
  },
  -- }}}

  -- telescope-fzf-native {{
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
  },
  -- }}

  -- boorkmarks {{{
  {
    "tomasky/bookmarks.nvim",
    event = "VimEnter",
    config = function()
      require "extensions.bookmarks"
    end
  },
  -- }}}

  -- obisidian {{{
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    -- event = {
    --   "BufReadPre " .. vim.fn.expand "~/kernel-vault" .. "/**.md",
    --   "BufNewFile  " .. vim.fn.expand "~/kernel-vault" .. "/**.md",
    -- },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",

      -- see below for full list of optional dependencies 👇
    },
    config = function()
      require "extensions.obsidian"
    end
  },
  -- }}}

  -- python-dap {{{
  {
    "mfussenegger/nvim-dap-python",
    config = function()
      require('dap-python').setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
    end,
    dependencies = {
      "mfussenegger/nvim-dap",
      "williamboman/mason.nvim",
    },
  },
  -- }}}

  -- nvim-autopairs {{{
  -- {
  --   'windwp/nvim-autopairs',
  --   event = "InsertEnter",
  --   config = true
  --   -- use opts = {} for passing setup options
  --   -- this is equalent to setup({}) function
  -- },
  -- }}}

  -- avante (cursor-like ide) {{{
  -- {
  --   "yetone/avante.nvim",
  --   event = "VeryLazy",
  --   lazy = false,
  --   version = false, -- set this if you want to always pull the latest change
  --   opts = {
  --     provider = "gemini",
  --     mode = "agentic",
  --     -- auto_suggestions_provider = "groq", -- Since auto-suggestions are a high-frequency operation and therefore expensive, it is recommended to specify an inexpensive provider or even a free provider: copilot
  --     cursor_applying_provider = "gemini",
  --     providers = {
  --       ollama = {
  --         endpoint = "http://127.0.0.1:11434", -- Note that there is no /v1 at the end.
  --         model = "hf.co/mlabonne/gemma-3-12b-it-abliterated-GGUF:Q8_0",
  --       },
  --       gemini = {
  --         -- endpoint = "https://generativelanguage.googleapis.com/v1beta/openai/",
  --         model = "gemini-2.5-flash",
  --         api_key_name = "AVANTE_GEMINI_API_KEY",
  --       }
  --     },
  --     behaviour = {
  --       auto_suggestions = false,
  --       enable_cursor_planning_mode = true,
  --     },
  --     windows = {
  --       input = { height = 30 },
  --     }
  --     -- add any opts here
  --   },
  --   -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  --   build = "make",
  --   -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  --   dependencies = {
  --     "stevearc/dressing.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "MunifTanjim/nui.nvim",
  --     --- The below dependencies are optional,
  --     "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
  --     "zbirenbaum/copilot.lua",      -- for providers='copilot'
  --     {
  --       -- support for image pasting
  --       "HakonHarnes/img-clip.nvim",
  --       event = "VeryLazy",
  --       opts = {
  --         -- recommended settings
  --         default = {
  --           embed_image_as_base64 = false,
  --           prompt_for_file_name = false,
  --           drag_and_drop = {
  --             insert_mode = true,
  --           },
  --           -- required for Windows users
  --           use_absolute_path = true,
  --         },
  --       },
  --     },
  --     {
  --       -- Make sure to set this up properly if you have lazy=true
  --       'MeanderingProgrammer/render-markdown.nvim',
  --       opts = {
  --         file_types = { "markdown", "Avante" },
  --       },
  --       ft = { "markdown", "Avante" },
  --     },
  --   },
  -- },
  -- }}}

  -- nvim-nio (async io lib for nvim) {{{
  { "nvim-neotest/nvim-nio" },
  -- }}}

  -- markdown.nvim (tools for working with md) {{{
  {
    "tadmccorkle/markdown.nvim",
    ft = "markdown", -- or 'event = "VeryLazy"'
    opts = {
      -- configuration here or empty for defaults
    },
  },
  -- }}}

  -- nvim-metals (scala) {{{
  {
    "scalameta/nvim-metals",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    ft = { "scala", "sbt", "java" },
    opts = function()
      local metals_config = require("metals").bare_config()
      metals_config.on_attach = function(client, bufnr)
        -- your on_attach function
      end

      return metals_config
    end,
    config = function(self, metals_config)
      local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = self.ft,
        callback = function()
          require("metals").initialize_or_attach(metals_config)
        end,
        group = nvim_metals_group,
      })
    end
  },
  -- }}}

  -- tex utils {{{
  {
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = "general"
    end
  },
  -- }}}

  {
    "andrewferrier/wrapping.nvim",
    config = function()
      require "extensions.wrapping"
    end
  },

  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      bigfile = { enabled = true },
      dashboard = { enabled = true },
      -- explorer = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      picker = { enabled = true },
      notifier = { enabled = true },
      -- quickfile = { enabled = true },
      scope = { enabled = true },
      -- scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    },
  },

  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    config = true,
    keys = {
      { "<leader>a",  nil,                              desc = "AI/Claude Code" },
      { "<leader>ac", "<cmd>ClaudeCode<cr>",            desc = "Toggle Claude" },
      { "<leader>af", "<cmd>ClaudeCodeFocus<cr>",       desc = "Focus Claude" },
      { "<leader>ar", "<cmd>ClaudeCode --resume<cr>",   desc = "Resume Claude" },
      { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
      { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
      { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>",       desc = "Add current buffer" },
      { "<leader>as", "<cmd>ClaudeCodeSend<cr>",        mode = "v",                  desc = "Send to Claude" },
      {
        "<leader>as",
        "<cmd>ClaudeCodeTreeAdd<cr>",
        desc = "Add file",
        ft = { "NvimTree", "neo-tree", "oil", "minifiles" },
      },
      -- Diff management
      { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
      { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>",   desc = "Deny diff" },
    },
  },

  {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
      require "extensions.conform"
    end
  }

}

-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=0
