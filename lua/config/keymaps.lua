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

-- LazyVim
vim.keymap.set("n", "<leader>L", "<cmd>:Lazy<cr>", { desc = "Lazy" })

-- Delete single character wo copying it to the register
vim.keymap.set("n", "x", '"_x')

-- Navigation
vim.keymap.set("n", "<leader>n", "", { desc = "Navigation" })

vim.keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Split vertically" }) -- split window vertically
vim.keymap.set("n", "<leader>we", "<C-w>=", { desc = "Equal split windows" }) -- make split windows equal width & height
vim.keymap.set("n", "<leader>wh", "<C-w>s", { desc = "Split horizontally" }) -- split window horizontally
vim.keymap.set("n", "<leader>wx", ":close<CR>", { desc = "Close window" }) -- close current split window
vim.keymap.set("n", "<leader>h", "<C-w>h", { desc = "Left window" }) -- jump to window on left
vim.keymap.set("n", "<leader>l", "<C-w>l", { desc = "Right window" }) -- jump to window on right
vim.keymap.set("n", "<leader>j", "<C-w>j", { desc = "Bottom window" }) -- jump to window on the bottom
vim.keymap.set("n", "<leader>k", "<C-w>k", { desc = "Top window" }) -- jump to window on the top

-- Search in the middle
vim.keymap.set("n", "n", "nzz", { noremap = true })

vim.keymap.set("n", "<leader>P", ":Telescope projects<CR>", { desc = "Projects" }) -- Not installed
-- Projects
vim.keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

-- Tmux Navigation
vim.keymap.set("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "Window Left" })
vim.keymap.set("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "Window Right" })
vim.keymap.set("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "Window Down" })
vim.keymap.set("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "Window Up" })

-- Code folding
-- vim.keymap.set("n", "<leader>z", "Folding", { desc = "Folding" })
vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "Open All Folds" })
vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "Close All Folds" })

-- Hop  -- used for nvim leap by default
vim.keymap.set("n", "s", ":HopChar1<cr>", { desc = "Hop to word" })
vim.keymap.set("n", "S", ":HopPattern<cr>", { desc = "Hop to Pattern" })

-- Terminal -- DEBUG C-m mapping
vim.keymap.set("n", "<C-m>", "<cmd>ToggleTerm size=12 direction=float<CR>", { desc = "Terminal" })
vim.keymap.set("n", "<leader>T", "ToggleTerm size=80 direction=vertical<CR>", { desc = "Terminal" })
vim.keymap.set("n", "<leader>Tv", "<cmd>ToggleTerm size=80 direction=vertical<CR>", { desc = "Vertical" })
vim.keymap.set("n", "<leader>Th", "<cmd>ToggleTerm size=12 direction=horizontal<CR>", { desc = "Horizontal" })

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

-- Maximize window
vim.keymap.set("n", "<Leader>wt", "<Cmd>lua require('maximize').toggle()<CR>", { desc = "Toggle maximize" })
vim.keymap.set("n", "<Leader>wr", "<Cmd>lua require('maximize').restore()<CR>", { desc = "Window Restore" })
vim.keymap.set("n", "<Leader>wm", "<Cmd>lua require('maximize').maximize()<CR>", { desc = "Maximize" })
