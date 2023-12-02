local ag = vim.api.nvim_create_augroup
local au = vim.api.nvim_create_autocmd

-- Highlight yanked text
-- See `:help vim.highlight.on_yank()`
local highlight_group = ag("YankHighlight", { clear = true })
au("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})
