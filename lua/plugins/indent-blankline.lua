-- {{{ Indent guides for Neovim
Constants = require("config.constants")
local functions = require("config.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

-- return {
--   "lukas-reineke/indent-blankline.nvim",
--   event = { "BufReadPost", "BufNewFile" },
--   opts = {
--     char = "▏",
--     -- char = "│",
--     filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
--     show_trailing_blankline_indent = false,
--   },
--   config = function()
--     -- vim.opt.list = true
--     -- vim.opt.listchars:append("space:⋅")
--     -- vim.opt.listchars:append("eol:↴")
--     require("indent_blankline").setup({
--       show_current_context = true,
--       show_current_context_start = true,
--       space_char_blankline = " ",
--     })
--   end,
-- }
--

return
-- {{{ Indent guides for Neovim
{
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPost", "BufNewFile" },
  enabled = Is_Enabled("indent-blankline"),
  opts = function(_, opts)
    if Use_Defaults("indent-blankline") then
      -- Use LazyVim default setup.
      opts = {}
    else
      -- Use my customizations.
      opts.char = "│"
      opts.filetype_exclude = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "Trouble",
        "lazy",
        "mason",
      }
      opts.show_trailing_blankline_indent = false
      opts.show_current_context = false
      opts.config = function()
        require("indent_blankline").setup({
          show_current_context = true,
          show_current_context_start = true,
          space_char_blankline = " ",
        })
      end
    end
  end,
}

-- ----------------------------------------------------------------------- }}}
