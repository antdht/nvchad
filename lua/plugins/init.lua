return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    opts = function()
      return require "configs.cmp"
    end,
  },

  {
    "mason-org/mason-lspconfig.nvim",
    lazy = false,
    config = function()
      require "configs.mason-lsp"
    end,
    dependencies = {
      {
        "mason-org/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonUpdate", "MasonInstallAll" },
        lazy = false,
        opts = function()
          return require "nvchad.configs.mason"
        end,
      },
      {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
          require "configs.lspconfig"
        end,
      },
    },
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = require "configs.nvim-treesitter",
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "rcarriga/nvim-notify",
    lazy = false,
    config = function()
      require "configs.notify"
    end,
  },

  -- DAP Stuff
  {
    -- requires debugpy (pacman -S python-debugpy | :MasonInstall debugpy)
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
  },

  {
    "lervag/vimtex",
    -- tag = "v2.15", -- uncomment to pin to a specific release
    lazy = false,
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = "mupdf"
      vim.g["vimtex_quickfix_mode"] = 1
      vim.g.maplocalleader = "\\"
      vim.g["vimtex_log_ignore"] = { -- Error suppression:
        "Underfull",
        "Overfull",
        "specifier changed to",
        "Token not allowed in a PDF string",
        "Package caption Warning: The option `hypcap=true' will be ignored",
      }
    end,
  },

  -- Can be good to add Trouble ()(folke/trouble.nvim)
  {
    "folke/todo-comments.nvim",
    event = "BufReadPost",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    -- config = function()
    --   require "configs.todo"
    -- end,
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
    }
  },
}
