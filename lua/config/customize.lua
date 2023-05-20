local Customize = {}

-- {{{ Customize documentation.
-- Customize table is a plugin name and true or false.  Using nvim_tree as the
-- example:
--   true - plug is loaded
--  false - plugin is NOT loaded.
--
-- This is a quick way to determine when a customization is interfering with
-- your expected behavior or two plugins are impacting with each other.

-- ------------------------------------------------------------------------- }}}

Customize = {
  -- {{{ Enable or disable plugins.

  plugins = {
    ["Comment.nvim"] = { enabled = false },
    ["lualine.nvim"] = { enabled = true, defaults = false },
    ["noice.nvim"] = { enabled = true, defaults = false },
    ["nvim-notify"] = { enabled = true, defaults = false },
    ["which-key.nvim"] = { enabled = true },
    ["gitsigns.nvim"] = { enabled = true },
    ["popup.nvim"] = { enabled = false },
    ["vim-most-minimal-folds"] = { enabled = true },
    ["virtcolumn.nvim"] = { enabled = true },
    ["markdown-preview.nvim"] = { enabled = true },
    ["indent-blankline"] = { enabled = true, defaults = false },
    ["vim-commentary"] = { enabled = true },
    ["vim-surround"] = { enabled = false },
    ["nvim-surround"] = { enabled = true },
    ["vim-repeat"] = { enabled = true },
    ["nvim-spectre"] = { enabled = true },
    ["harpoon"] = { enabled = true, defaults=false},
    ["vim-unimpaired"] = { enabled = true },
    ["vim-easy-align"] = { enabled = true },
    ["neoformat"] = { enabled = false },
    ["vim-bundler"] = { enabled = true },
    ["vim-bbye"] = { enabled = true },
    ["vim-eunuch"] = { enabled = true },
    ["vim-dispatch"] = { enabled = true },
    ["vim-fugitive"] = { enabled = true },
    ["vim-rails"] = { enabled = true },
    ["vim-rake"] = { enabled = true },
    ["vim-rbenv"] = { enabled = true },
    ["vim-speeddating"] = { enabled = true },
    ["zen-mode.nvim"] = { enabled = true },
    ["vim-endwise"] = { enabled = true },
    ["nvim-autopairs"] = { enabled = true },
    ["maximize"] = { enabled = true },
		["vim-bundle-plantuml"] = { enabled = true },
    -- Finders
		["fzf.vim"] = { enabled = true },
		["vim-projectionist"] = { enabled = true },
		["telescope.nvim"] = { enabled = true },
		["telescope-fzf-native.nvim"] = { enabled = true },
		["todo-comments.nvim"] = { enabled = true  },
    -- TMUX
    ["vim-bundle-tmux-runner"] = { enabled = true },
    ["vim-tmux-navigator"] = { enabled = true },
    ["vim-tmux-runner"] = { enabled = true },
    -- DAP
		["telescope-dap.nvim"] = { enabled = true },
		["mason-nvim-dap.nvim"] = { enabled = true },
    ["nvim-dap"] = { enabled = true },
    ["nvim-dap-go"] = { enabled = true },
    ["nvim-dap-python"] = { enabled = true },
    ["nvim-dap-ruby"] = { enabled = true },
    ["nvim-dap-ui"] = { enabled = true, defaults = false },
    ["nvim-dap-virtual-text"] = { enabled = true },
    -- Themes
    ["tokyonight.nvim"] = { enabled = true, defaults = false },
    ["everforest"] = { enabled = true },
    ["nvim-base16"] = { enabled = false },
    ["catppuccin"] = { enabled = true },
    ["nvim-colorizer.lua"] = { enabled = false },
    -- Can disable background
    ["nvim-transparent"] = { enabled = false },
    ["nvim-treesitter"] = { enabled = true, defaults = true },
    ["nvim-ts-rainbow"] = { enabled = true },
    ["rainbow_csv"] = { enabled = true },
    ["sxhkd-vim"] = { enabled = false },
    ["cobalt2"] = { enabled = true },
  },

  -- {{{ Debug Adapter Protocol (DAP) debuggers

  debuggers = {
    -- ["bash"] = { enabled = false },
    -- ["dart"] = { enabled = false },
    -- ["go"] = { enabled = true },
    -- ["haskell"] = { enabled = false },
    -- ["java"] = { enabled = false },
    ["lua"] = { enabled = true },
    ["python"] = { enabled = true },
    ["ruby"] = { enabled = true },
    ["rust"] = { enabled = false },
  },

  -- ------------------------------------------------------------------------- }}}
}

return Customize
