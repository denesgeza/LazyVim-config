Is_Enabled = require("config.functions").is_enabled

return {
  -- {{{ vim-bundler

  {
    "tpope/vim-bundler",
    event = { "BufEnter *.rb" },
    enabled = Is_Enabled("vim-bundler"),
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ maximize
  {
    "declancm/maximize.nvim",
    enabled = Is_Enabled("maximize"),
    opts = {
      default_keymaps = false,
    },
    config = function()
      require("maximize").setup({
        default_keymaps = false,
      })
    end,
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ vim-bbye

  {
    "moll/vim-bbye",
    event = { "BufReadPost", "BufNewFile" },
    enabled = Is_Enabled("vim-bbye"),
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ vim-eunuch

  {
    "tpope/vim-eunuch",
    event = { "BufReadPost", "BufNewFile" },
    enabled = Is_Enabled("vim-eunuch"),
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ vim-dispatch

  {
    "tpope/vim-dispatch",
    event = { "BufReadPost", "BufNewFile" },
    enabled = Is_Enabled("vim-dispatch"),
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ vim-fugitive

  {
    "tpope/vim-fugitive",
    lazy = false,
    enabled = Is_Enabled("vim-fugitive"),
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ vim-rails

  {
    "tpope/vim-rails",
    event = { "BufEnter *.rb" },
    enabled = Is_Enabled("vim-rails"),
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ vim-rake

  {
    "tpope/vim-rake",
    event = { "BufEnter *.rb", "BufEnter Rakefile" },
    enabled = Is_Enabled("vim-rake"),
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ vim-rbven

  {
    "tpope/vim-rbenv",
    event = { "BufEnter *.rb" },
    enabled = Is_Enabled("vim-rbenv"),
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ vim-speeddating

  {
    "tpope/vim-speeddating",
    event = { "BufReadPost", "BufNewFile" },
    enabled = Is_Enabled("vim-speeddating"),
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ toggleterm.nvim

  {
    "akinsho/toggleterm.nvim",
    enabled = Is_Enabled("toggleterm.nvim"),
    version = "*",
    opts = {
      size = 13,
      hide_numbers = true,
      open_mapping = [[<c-\>]],
      shade_filetypes = {},
      shading_factor = 2,
      shade_terminals = true,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "horizontal",
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    },
    -- keys = {
    --   {
    --     "<leader>Tf",
    --     "<leader>Tl",
    --     "<leader>Tr",
    --   },
    -- },
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ zen-mode.nvim

  {
    "folke/zen-mode.nvim",
    enabled = Is_Enabled("zen-mode.nvim"),
    opts = {
      window = {
        width = 0.65,
        height = 0.85,
        options = {
          colorcolumn = "",
          cursorcolumn = false,
          cursorline = false,
          number = true,
          relativenumber = true,
        },
      },
      plugins = {
        enabled = true,
        options = {
          ruler = false,
          showmd = true,
        },
        twilight = { enabled = false },
        gitsigns = { enabled = false },
        tmux = { enabled = false },
        alacritty = {
          enabled = true,
          font = "15",
        },
      },
    },
  },

  -- ----------------------------------------------------------------------- }}}
}
