Customize = require("config.customize")
Constants = require("config.constants")
Is_Enabled = require("config.functions").is_enabled
Use_Defaults = require("config.functions").use_plugin_defaults

return {
  -- {{{ kanagawa
  {
    "rebelot/kanagawa.nvim",
    enabled = Is_Enabled("kanagawa"),
    lazy = false,
    name = "kanagawa",
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        compile = false, -- enable compiling the colorscheme
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = false, -- do not set background color
        dimInactive = false, -- dim inactive window `:h hl-NormalNC`
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        colors = { -- add/modify theme and palette colors
          palette = {},
          theme = {
            wave = {},
            lotus = {},
            dragon = {},
            all = {
              ui = {
                bg_gutter = "none",
              },
            },
          },
        },
        overrides = function(colors) -- add/modify highlights
          -- Get the colors for the current theme
          local colors = require("kanagawa.colors").setup()
          local palette_colors = colors.palette
          local theme_colors = colors.theme

          -- Get the colors for a specific theme
          local wave_colors = require("kanagawa.colors").setup({ theme = "wave" })

          local theme = colors.theme
          return {
            -- TelescopeTitle = { fg = theme.ui.special, bold = true },
            -- TelescopePromptNormal = { bg = theme.ui.bg_p1 },
            -- TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
            -- TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
            -- TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
            -- TelescopePreviewNormal = { bg = theme.ui.bg_dim },
            -- TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
            NormalFloat = { bg = "none" },
            FloatBorder = { bg = "none" },
            FloatTitle = { bg = "none" },

            -- Save an hlgroup with dark background and dimmed foreground
            -- so that you can use it where your still want darker windows.
            -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
            NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

            -- Popular plugins that open floats will link to NormalFloat by default;
            -- set their background accordingly if you wish to keep them dark and borderless
            LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            Pmenu = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
            PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
            PmenuSbar = { bg = theme.ui.bg_m1 },
            PmenuThumb = { bg = theme.ui.bg_p2 },
          }
        end,
        theme = "wave", -- Load "wave" theme when 'background' option is not set
        background = { -- map the value of 'background' option to a theme
          dark = "wave", -- try "dragon" !
          light = "lotus",
        },
      })
    end,
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    enabled = Is_Enabled("gruvbox"),
    lazy = false,
    priority = 1000,
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Night-owl
  {
    "oxfist/night-owl.nvim",
    enabled = Is_Enabled("night-owl"),
    lazy = false,
    name = "night-owl",
    priority = 1000,
    opts = {},
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ nvim-base16

  {
    "RRethy/nvim-base16",
    enabled = Is_Enabled("nvim-base16"),
    lazy = false,
    priority = 1000,

    config = function()
      vim.cmd([[colorscheme base16-tokyo-night-terminal-storm]])
    end,
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ tokyonight.nvim

  {
    "folke/tokyonight.nvim",
    enabled = Is_Enabled("tokyonight.nvim"),
    lazy = false,
    opts = function(_, opts)
      if Use_Defaults("tokyonight.nvim") then
        -- Use LazyVim default setup.
        opts = opts
      else
        opts.style = "night"
        opts.styles = {
          sidebars = "transparent",
          floats = "transparent",
        }
      end
    end,
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ everforest

  {
    "neanias/everforest-nvim",
    enabled = Is_Enabled("everforest"),
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    -- Optional; default configuration will be used if setup isn't called.
    config = function()
      require("everforest").setup({
        -- Your config here
      })
    end,
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Catpuccin

  {
    "catppuccin/nvim",
    name = "catppuccin",
    enabled = Is_Enabled("catppuccin"),
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme "catppuccin"]])
    end,
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ nvim-colorizer

  {
    "NvChad/nvim-colorizer.lua",
    event = { "BufReadPost", "BufNewFile" },
    enabled = Is_Enabled("nvim-colorizer.lua"),
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ nvim-transpartent

  {
    "xiyaowong/nvim-transparent",
    enabled = Is_Enabled("nvim-transparent"),
    lazy = false,
    event = "VimEnter",
    opts = {
      enable = true,
      "Comment",
      extra_gropus = {
        "CursorLine",
        "CursorLineNr",
        "CursorLineSign",
        "Folded",
        "LineNr",
        "Normal",
        "SignColumn",
      },
      exclude = {
        "ColorColumn",
        "EndOfBuffer",
        "NonText",
      },
    },
    config = function()
      vim.cmd([[TransparentEnable]])
    end,
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ nvim-ts-rainbow

  {
    "mrjones2014/nvim-ts-rainbow",
    event = { "BufReadPost", "BufNewFile" },
    enabled = Is_Enabled("nvim-ts-rainbow"),
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ rainbow_csv

  {
    "mechatroner/rainbow_csv",
    ft = { "csv", "tsv" },
    enabled = Is_Enabled("rainbow_csv"),
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ sxhkd-vim

  {
    "kovetskiy/sxhkd-vim",
    enabled = Is_Enabled("sxhkd-vim"),
    event = "VeryLazy",
    lazy = false,
    priority = 1000,
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ cobalt2
  {
    "lalitmee/cobalt2.nvim",
    lazy = false,
    priority = 1000,
    enabled = Is_Enabled("cobalt2"),
    -- event = { "ColorSchemePre" }, -- if you want to lazy load
    dependencies = { "tjdevries/colorbuddy.nvim" },
    config = function()
      require("colorbuddy").colorscheme("cobalt2")
    end,
  },

  -- ----------------------------------------------------------------------- }}}

  -- {{{ Set default theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
  },
  -- ----------------------------------------------------------------------- }}}
}
