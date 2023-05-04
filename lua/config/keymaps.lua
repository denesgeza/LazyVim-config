-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set(
  "n",
  "<leader>sx",
  require("telescope.builtin").resume,
  { noremap = true, silent = true, desc = "Resume" }
)
-- ESC keymap
vim.keymap.set("i", "kj", "<Esc>")
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("i", "KJ", "<Esc>")
vim.keymap.set("i", "JK", "<Esc>")

-- Delete single character wo copying it to the register
vim.keymap.set("n", "x", '"_x')

-- Quit
vim.keymap.set("n", "<leader>q", ":q")
