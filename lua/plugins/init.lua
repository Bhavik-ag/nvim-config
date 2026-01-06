return {
  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    event = {'BufReadPre', 'BufNewFile'},
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "github/copilot.vim",
    lazy = false,
  },
  -- Mason for automatic LSP server installation
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "tailwindcss-language-server",
        "typescript-language-server",
        "html-lsp",
        "css-lsp",
        "json-lsp",
        "prettier",
        "biome",
        "eslint-lsp",
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = {
          "ts_ls",
          "html",
          "cssls",
          "jsonls",
        },
        automatic_installation = true,
      }
    end,
  },

  -- Treesitter for better syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "scss",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "jsonc",
        "markdown",
        "markdown_inline",
      },
    },
  },
  {
    "rmagatti/auto-session",
    lazy = false,
    keys = {
      -- Will use Telescope if installed or a vim.ui.select picker otherwise
      { "<leader>lp", "<cmd>AutoSession search<CR>", desc = "Session search" },
      { "<leader>ls", "<cmd>AutoSession save<CR>", desc = "Save session" },
      { "<leader>sa", "<cmd>AutoSession toggle<CR>", desc = "Toggle autosave" },
      { "<leader>ld", "<cmd>AutoSession delete<CR>", desc = "Delete session" },
    },
    opts = {
      session_lens = {
        picker = nil,
        picker_opts = {
          border = true,
          -- layout_config = {
          --   width = 0.8,
          --   height = 0.5,
          -- },
        },
        load_on_setup = true,
      },
    },
  },
  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },
  {
    "sourcegraph/amp.nvim",
    branch = "main",
    lazy = false,
    opts = { auto_start = true, log_level = "info" },
  },
  {
    "kevinhwang91/nvim-ufo",
    lazy = false,
    dependencies = { "kevinhwang91/promise-async" },
    config = function()
      require "configs.nvim-ufo"
    end,
  },
  {
    "Pocco81/true-zen.nvim",
    lazy = false,
  }
}
