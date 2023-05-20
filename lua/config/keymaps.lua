-- {{{ Global definitions

Customize = require("config.customize")
Functions = require("config.functions")
Keymap = Functions.keymap
Is_Enabled = Functions.is_enabled

-- ------------------------------------------------------------------------- }}}
-- {{{ General mappings

-- ESC key
Keymap("i", "kj", "<Esc>")

-- Clear search
Keymap("n", "<Esc>", "<cmd>nohlsearch<cr>")

-- Navigation
Keymap("n", "<leader>h", "<C-w>h", { desc = "Left window" }) -- jump to window on left
Keymap("n", "<leader>l", "<C-w>l", { desc = "Right window" }) -- jump to window on right
Keymap("n", "<leader>j", "<C-w>j", { desc = "Bottom window" }) -- jump to window on the bottom
Keymap("n", "<leader>k", "<C-w>k", { desc = "Top window" }) -- jump to window on the top

-- Delete single character wo copying it to the register
Keymap("n", "x", '"_x')

-- Delete the current line.
Keymap("n", "-", "dd")

-- Select (charwise) the contents of the current line, excluding indentation.
Keymap("n", "vv", "^vg_")

-- Select entire buffer
Keymap("n", "vaa", "ggvGg_")
Keymap("n", "Vaa", "ggVG")
Keymap("n", "<leader>V", "V`]")

-- Save all files.
Keymap("n", "<F2>", "<cmd>wall<cr>")

-- Toggle [in]visible characters.
Keymap("n", "<leader>i", "<cmd>set list!<cr>")

-- Stay in indent mode.
Keymap("v", "<", "<gv")
Keymap("v", ">", ">gv")

-- Visual yank
Keymap("v", "<leader>cc", '"+y')

-- Obfuscate
Keymap("n", "<f3>", "mmggg?G`m")

-- <leader>x conflicts with LazyVim
-- Keymap("n", "<leader>X", "<Plug>(bullets-toggle-checkbox)")

-- ------------------------------------------------------------------------- }}}
-- {{{ b - Buffer adjustments.

Keymap("n", "<leader>bl", "<cmd>vertical resize -1<cr>")
Keymap("n", "<leader>bh", "<cmd>vertical resize +1<cr>")
Keymap("n", "<leader>bj", "<cmd>resize +1<cr>")
Keymap("n", "<leader>bk", "<cmd>resize -1<cr>")
Keymap("n", "<leader>bx", [[<cmd>w<cr><cmd>luafile %<cr><cmd>echo "Sourced " . @%<cr>]])

-- ------------------------------------------------------------------------- }}}
-- {{{ f - Find & tmux

if Is_Enabled("telescope.nvim") then
  Keymap("n", "<leader>fC", "<cmd>Telescope commands<cr>")
  Keymap("n", "<leader>fF", "<cmd>Telescope media_files<cr>")
  Keymap("n", "<leader>fM", "<cmd>Telescope man_pages<cr>")
  Keymap("n", "<leader>fO", "<cmd>Telescope oldfiles<cr>")
  Keymap("n", "<leader>fR", "<cmd>Telescope registers<cr>")
  Keymap("n", "<leader>fS", "<cmd>Telescope colorscheme<cr>")
  Keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
  Keymap("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>")
  Keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
  Keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
  Keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
  Keymap("n", "<leader>fk", "<cmd>Telescope keymaps<cr>")
  Keymap("n", "<leader>fl", "<cmd>Telescope resume<cr>")
  Keymap("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>")
  Keymap("n", "<leader>fp", "<cmd>Telescope planets<cr>")
  Keymap("n", "<leader>fw", "<cmd>Telescope grep_string<cr>")
end

if Is_Enabled("todo-comments.nvim") then
  Keymap("n", "<leader>fy", "<cmd>TodoTelescope keywords=Youtube,URL<cr>")
end

if Is_Enabled("vim-tmux-runner") then
  Keymap("n", "<leader>fc", "<cmd>VtrFlushCommand<cr>")
  Keymap("n", "<leader>fr", "<cmd>VtrFocusRunner<cr>")
end

-- TODO: Write the implementations.
-- Keymap("v", "<leader>f", "<cmd>lua Functions.surround_selected_text()<cr>")

-- ------------------------------------------------------------------------- }}}
-- {{{ g - git

if Is_Enabled("telescope.nvim") then
  Keymap("n", "<leader>gC", "<cmd>Telescope git_commits<cr>", { desc = "Git commits" })
  Keymap("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", { desc = "Git branches" })
  Keymap("n", "<leader>go", "<cmd>Telescope git_status<cr>", { desc = "Git status" })
end

if Is_Enabled("vim-fugitive") then
  Keymap("n", "<leader>gc", "<cmd>G commmit<cr>", { desc = "Commit" })
  Keymap("n", "<leader>gd", "<cmd>G diff<cr>", { desc = "Diff" })
  Keymap("n", "<leader>gl", "<cmd>G log<cr>", { desc = "Git log" })
  Keymap("n", "<leader>gh", "<cmd>vert bo help fugitive<cr>")
  Keymap("n", "<leader>gp", "<cmd>G push<cr>", { desc = "Push" })
  Keymap("n", "<leader>gP", "<cmd>G pull<cr>", { desc = "Pull" })
  Keymap("n", "<leader>gs", "<cmd>G<cr>")
end

if Is_Enabled("vim-bundle-plantuml") then
  Keymap("n", "<leader>gu", "<cmd>call GenerateUmlDiagram<cr>")
end

Keymap("n", "gk", [[0mMvg_"ky <cmd>exec 'r!kjv -b -d -w 65' getreg('k')<cr>]])
Keymap("v", "gk", [["ky <cmd>exec 'r!kjv -b -d -w 65' getreg('k')<cr>]])

-- ------------------------------------------------------------------------- }}}
-- {{{ H - Help

Keymap("n", "<leader>H", "<cmd>silent vert bo help<cr>", { desc = "Help" })

-- ------------------------------------------------------------------------- }}}
-- {{{ L - Lazy

-- LazyVim
Keymap("n", "<leader>L", "<cmd>:Lazy<cr>", { desc = "Lazy" })

-- ------------------------------------------------------------------------- }}}
-- {{{ w - Window

Keymap("n", "<leader>wv", "<C-w>v", { desc = "Split vertically" }) -- split window vertically
Keymap("n", "<leader>we", "<C-w>=", { desc = "Equal split windows" }) -- make split windows equal width & height
Keymap("n", "<leader>wh", "<C-w>s", { desc = "Split horizontally" }) -- split window horizontally
Keymap("n", "<leader>wx", ":close<CR>", { desc = "Close window" }) -- close current split window

-- Maximize window
Keymap("n", "<Leader>wt", "<Cmd>lua require('maximize').toggle()<CR>", { desc = "Toggle maximize" })
Keymap("n", "<Leader>wr", "<Cmd>lua require('maximize').restore()<CR>", { desc = "Restore" })
Keymap("n", "<Leader>wm", "<Cmd>lua require('maximize').maximize()<CR>", { desc = "Maximize" })

-- ------------------------------------------------------------------------- }}}
-- {{{ o - Options

Keymap("n", "<leader>oh", "<cmd>checkhealth<cr>")
Keymap("n", "<leader>oo", "<cmd>only<cr>")

-- TODO: Add Tmux Runner
if Is_Enabled("vim-tmux-runner") then
  Keymap("n", "<leader>or", [[<cmd>VtrOpenRunner {'orientation': 'h', 'percentage': 50}<cr>]])
end

if Is_Enabled("zen-mode.nvim") then
  Keymap("n", "<leader>oz", [[<cmd>lua require("zen-mode").toggle()<cr>]])
end

-- ------------------------------------------------------------------------- }}}
-- {{{ P - Projects

Keymap("n", "<leader>P", ":Telescope projects<CR>", { desc = "Projects" }) -- Not installed

-- ------------------------------------------------------------------------- }}}

vim.keymap.set(
  "n",
  "<leader>sx",
  require("telescope.builtin").resume,
  { noremap = true, silent = true, desc = "Resume" }
)

-- Search in the middle
vim.keymap.set("n", "n", "nzz", { noremap = true })

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

-- Outline
vim.keymap.set("n", "<Leader>o", "<Cmd>SymbolsOutline<CR>", { desc = "Outline" })
