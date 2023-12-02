local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G", "Gdiff" },
  },

  {
    -- Detect tabstop and shiftwidth automatically
    "tpope/vim-sleuth",
    lazy = false,
  },

  {
    "voldikss/vim-floaterm",
    cmd = { "FloatermNew" },
    -- lazy = false,
  },
  -- This one also works, just make sure to add this to mappings.lua. Floaterm seems to work better tho
  --
  -- ["<leader>gg"] = { ":LazyGit<CR>", opts = { silent = true } }
  --
  -- {
  --   "kdheepak/lazygit.nvim",
  --   lazy = false,
  --   -- optional for floating window border decoration
  --   dependencies = {
  --       "nvim-lua/plenary.nvim",
  --   },
  -- },

  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- load the plugin before saving
    opts = {},
    config = function()
      local conform = require "conform"

      conform.setup {
        formatters_by_ft = {
          lua = { "stylua" },

          html = { "prettierd" },
          css = { "prettierd" },
          scss = { "prettierd" },
          javascript = { "prettierd" },
          javascriptreact = { "prettierd" },
          typescript = { "prettierd" },
          typescriptreact = { "prettierd" },
          svelte = { "prettierd" },
          json = { "prettierd" },
          markdown = { "prettierd" },
          yaml = { "prettierd" },
        },

        format_on_save = function(bufnr)
          -- Disable autoformat for files in a certain path
          local bufname = vim.api.nvim_buf_get_name(bufnr)
          if bufname:match "/node_modules/" then
            return
          end

          return { timeout_ms = 500, lsp_fallback = true, async = true }
        end,
      }
    end,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
