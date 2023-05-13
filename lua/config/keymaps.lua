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

-- LazyVim
vim.keymap.set("n", "<leader>L", "<cmd>:Lazy<cr>", { desc = "Lazy" })

-- Delete single character wo copying it to the register
vim.keymap.set("n", "x", '"_x')

-- Navigation
vim.keymap.set("n", "<leader>n", "", { desc = "Navigation" })

vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Equal split windows" }) -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", ":close<CR>", { desc = "Close window" }) -- close current split window
vim.keymap.set("n", "<leader>h", "<C-w>h", { desc = "Left window" }) -- jump to window on left
vim.keymap.set("n", "<leader>l", "<C-w>l", { desc = "Right window" }) -- jump to window on right
vim.keymap.set("n", "<leader>j", "<C-w>j", { desc = "Bottom window" }) -- jump to window on the bottom
vim.keymap.set("n", "<leader>k", "<C-w>k", { desc = "Top window" }) -- jump to window on the top

-- Tabs
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Close tab" }) -- close current tab

-- Search in the middle
vim.keymap.set("n", "n", "nzz", { noremap = true })

-- Projects
vim.keymap.set("n", "<leader>P", ":Telescope projects<CR>", { desc = "Projects" }) -- Not installed
vim.keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

-- Tmux Navigation
vim.keymap.set("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "Window Left" })
vim.keymap.set("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "Window Right" })
vim.keymap.set("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "Window Down" })
vim.keymap.set("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "Window Up" })

-- Code folding
vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "Open All Folds" })
vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "Close All Folds" })

-- Hop
vim.keymap.set("n", "s", ":HopWord<cr>", { desc = "Hop to word" })
vim.keymap.set("n", "S", ":HopPattern<cr>", { desc = "Hop to Pattern" })

-- Terminal
vim.keymap.set("n", "<C-m>", "<cmd>ToggleTerm size=12 direction=float<CR>", { desc = "Terminal" })
function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "kj", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end
