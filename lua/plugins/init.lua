return {
  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
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
    },

    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
      -- The following are already the default values, no need to provide them if these are already the settings you want.
      session_lens = {
        picker = nil, -- "telescope"|"snacks"|"fzf"|"select"|nil Pickers are detected automatically but you can also manually choose one. Falls back to vim.ui.select
        mappings = {
          -- Mode can be a string or a table, e.g. {"i", "n"} for both insert and normal mode
          delete_session = { "i", "<C-d>" },
          alternate_session = { "i", "<C-s>" },
          copy_session = { "i", "<C-y>" },
        },

        picker_opts = {
          -- For Telescope, you can set theme options here, see:
          -- https://github.com/nvim-telescope/telescope.nvim/blob/master/doc/telescope.txt#L112
          -- https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/themes.lua
          --
          border = true,
          -- layout_config = {
          --   width = 0.8, -- Can set width and height as percent of window
          --   height = 0.5,
          -- },
        },

        -- Telescope only: If load_on_setup is false, make sure you use `:AutoSession search` to open the picker as it will initialize everything first
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
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
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
}
