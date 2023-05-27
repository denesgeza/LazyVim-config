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
    ["alpha-nvim"] = { enabled = false },
    ["Comment.nvim"] = { enabled = false },
		["LuaSnip"] = { enabled = true },
    ["lualine.nvim"] = { enabled = true, defaults = false },
		["leap.nvim"] = { enabled = false },
    ["noice.nvim"] = { enabled= true, defaults = false },
    ["nvim-notify"] = { enabled = true, defaults = false },
    ["which-key.nvim"] = { enabled = true },
    ["gitsigns.nvim"] = { enabled = true },
    ["popup.nvim"] = { enabled = false },
    ["vim-most-minimal-folds"] = { enabled = false },
    ["virtcolumn.nvim"] = { enabled = true },
    ["markdown-preview.nvim"] = { enabled = true },
    ["indent-blankline"] = { enabled = true, defaults = false },
    ["vim-commentary"] = { enabled = true },
    ["vim-surround"] = { enabled = false },
    ["nvim-surround"] = { enabled = true },
    ["vim-repeat"] = { enabled = true },
    ["harpoon"] = { enabled = true, defaults=false},
    ["vim-unimpaired"] = { enabled = false },
    ["vim-easy-align"] = { enabled = true },
    ["neoformat"] = { enabled = false },
		["neoconf.nvim"] = { enabled = false },
		["neodev.nvim"] = { enabled = true },
    ["vim-endwise"] = { enabled = true },
    ["nvim-autopairs"] = { enabled = true },
		["vim-bundle-plantuml"] = { enabled = false },
		["nvim-cmp"] = { enabled = true, defaults = false },
		["dressing"] = { enabled = true },
		["flit.nvim"] = { enabled = false },
		["mini-ai"] = { enabled = true },
		-- ["mini-starter"] = { enabled = true },
		["trouble.nvim"] = { enabled = true },
		["vimtex"] = { enabled = false },
		["vim-bundle-vimtex"] = { enabled = false },
    -- Utilities
    ["vim-bundler"] = { enabled = true },
    ["maximize"] = { enabled = true },
    ["vim-bbye"] = { enabled = true },
    ["vim-eunuch"] = { enabled = true },
    ["vim-dispatch"] = { enabled = true },
    ["vim-fugitive"] = { enabled = true },
    ["vim-rails"] = { enabled = false },
    ["vim-rake"] = { enabled = false },
    ["vim-rbenv"] = { enabled = true },
    ["vim-speeddating"] = { enabled = false },
    ["zen-mode.nvim"] = { enabled = true },
      -- Terminal
		["toggleterm.nvim"] = { enabled = true },
    -- Folding
    ["ufo"] = { enabled = true },
    -- Editing
		["bullets.vim"] = { enabled = false },
    ["nvim-spectre"] = { enabled = true },
    -- Explorers
		["gem-browse"] = { enabled = false },
		["neo-tree.nvim"] = { enabled = true, defaults = true },
		["nvim-tree"] = { enabled = false },
		["nvim-web-devicons"] = { enabled = true },
    -- Finders
		["fzf.vim"] = { enabled = true },
		["vim-projectionist"] = { enabled = true },
		["telescope.nvim"] = { enabled = true },
		["telescope-fzf-native.nvim"] = { enabled = true },
		["todo-comments.nvim"] = { enabled = true  },
    -- LSP
		["mason.nvim"] = { enabled = true },
		["nvim-lspconfig"] = { enabled = true },
		["null-ls.nvim"] = { enabled = true },
    ["nvim-treesitter"] = { enabled = true, defaults = true },
    -- TMUX
    ["vim-bundle-tmux-runner"] = { enabled = false },
    ["vim-tmux-navigator"] = { enabled = false },
    ["vim-tmux-runner"] = { enabled = false },
    -- DAP
		["telescope-dap.nvim"] = { enabled = false },
		["mason-nvim-dap.nvim"] = { enabled = false },
    ["nvim-dap"] = { enabled = false },
    ["nvim-dap-go"] = { enabled = false },
    ["nvim-dap-python"] = { enabled = true },
    ["nvim-dap-ruby"] = { enabled = false },
    ["nvim-dap-ui"] = { enabled = false, defaults = false },
    ["nvim-dap-virtual-text"] = { enabled = false },
    -- Themes
    ["tokyonight.nvim"] = { enabled = true, defaults = false },
    ["everforest"] = { enabled = true },
    ["kanagawa"] = { enabled = true },
    ["night-owl"] = { enabled = true },
    ["gruvbox"] = { enabled = true },
    ["nvim-base16"] = { enabled = true },
    ["catppuccin"] = { enabled = true },
    ["nvim-colorizer.lua"] = { enabled = false },
    -- Can disable background
    ["nvim-transparent"] = { enabled = false },
    ["nvim-ts-rainbow"] = { enabled = false },
    ["rainbow_csv"] = { enabled = true },
    ["sxhkd-vim"] = { enabled = false },
    ["cobalt2"] = { enabled = false },
  },

  -- {{{ Debug Adapter Protocol (DAP) debuggers

  debuggers = {
    ["bash"] = { enabled = false },
    ["dart"] = { enabled = false },
    ["go"] = { enabled = false },
    ["haskell"] = { enabled = false },
    ["java"] = { enabled = false },
    ["lua"] = { enabled = true },
    ["python"] = { enabled = true },
    ["ruby"] = { enabled = false },
    ["rust"] = { enabled = false },
  },

  -- ------------------------------------------------------------------------- }}}
}

-- {{{ Toggle terminals

Customize.toggleterm = {

	float = function()
		local Terminal = require("toggleterm.terminal").Terminal
		local t = Terminal:new({ direction = "float" })
		return t:toggle()
	end,

  horizontal = function ()
    local Terminal = require("toggleterm.terminal").Terminal
    local t = Terminal:new({ direction = "horizontal", size = 12 })
    return t:toggle()
  end,

	lazygit = function()
		local Terminal = require("toggleterm.terminal").Terminal
		local t = Terminal:new({ cmd = "lazygit", direction = "float" })
		return t:toggle()
	end,

	neomutt = function()
		local Terminal = require("toggleterm.terminal").Terminal
		local t = Terminal:new({ cmd = "neomutt", direction = "float" })
		return t:toggle()
	end,

	ranger = function()
		local Terminal = require("toggleterm.terminal").Terminal
		local t = Terminal:new({ cmd = "ranger", direction = "float" })
		return t:toggle()
	end,
}

-- ------------------------------------------------------------------------- }}}
return Customize
