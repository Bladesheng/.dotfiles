local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",

    "lua",

    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "svelte",

    "c",

    "markdown",
    "markdown_inline",

    "bash",

    "go",

    "php",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    "lua-language-server",
    "stylua",

    "html-lsp",
    "css-lsp",
    "tailwindcss-language-server",
    "typescript-language-server",
    "deno",
    "svelte-language-server",
    "prettierd",

    "gopls",

    "phpactor",
    "php-cs-fixer",

    "yaml-language-server",

    "clangd",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
    ignore = false, -- show ignored files
  },

  filters = {
    dotfiles = true, --show dotfiles
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
