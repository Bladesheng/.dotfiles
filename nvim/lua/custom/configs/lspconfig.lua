local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- all the names: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

-- if you just want default config for the servers then put them in a table
local servers = {
  "html",
  "cssls",
  "tailwindcss",
  "tsserver",
  -- "denols"
  "svelte",

  "gopls",

  "phpactor",

  "yamlls",

  "clangd",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

--
-- lspconfig.pyright.setup { blabla}
