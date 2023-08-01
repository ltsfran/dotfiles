local M = {}

M.general = {
  i = {
    ["jk"] = { "<ESC>"}
  },
  n = {
    ["<leader>sv"] = { "<C-w>v" },
    ["<leader>sh"] = { "<C-w>s" },
    ["<leader>se"] = { "<C-w>=" },
    ["<leader>sx"] = { ":close<CR>" }
  }
}

return M
