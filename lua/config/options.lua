-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- vim.opt.winbar = "%m=%m %f"
vim.opt.scrolloff = 5
vim.opt.smartcase = true
vim.opt.autoindent = true

-- https://github.com/neovim/nvim-lspconfig/wiki/UI-customization
vim.diagnostic.config({ virtual_text = false })

-- Code folding
-- https://alpha2phi.medium.com/neovim-for-beginners-code-folding-7574925412ea
-- vim.opt.foldcolumn = "1"
-- vim.opt.foldlevel = 99
-- vim.opt.foldlevelstart = 99
-- vim.opt.foldenable = true
