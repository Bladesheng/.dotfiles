---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    -- always center ctrl-d and ctrl-u
    ["<C-d>"] = { "<C-d>zz" },
    ["<C-u>"] = { "<C-u>zz" },

    -- keep search results in the middle
    ["n"] = { "nzzzv" },
    ["N"] = { "Nzzzv" },

    ["<leader>gg"] = {
      ":FloatermNew --height=0.95 --width=0.95 --title=lazygit lazygit<CR>",
      "open lazygit in floaterm",
    },

    ["<leader>R"] = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "Live replace" },

    ["<leader>dg"] = {
      function()
        vim.cmd [[call doge#generate('')]]
      end,
      "Generate comment block with DoGe",
    },
  },
  v = {
    [">"] = { ">gv", "indent" },

    ["J"] = { ":m '>+1<CR>gv=gv", "move selected block down" },
    ["K"] = { ":m '<-2<CR>gv=gv", "move selected block up" },

    -- delete to void register
    ["<leader>d"] = { '"_d' },
  },
}

-- more keybinds!

return M
