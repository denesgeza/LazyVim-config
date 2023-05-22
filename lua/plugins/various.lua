Constants = require("config.constants")
local functions = require("config.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

return {

  -- {{{ Popup.nvim

  {
    "nvim-lua/popup.nvim",
    event = "VimEnter",
    enabled = Is_Enabled("popup.nvim"),
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ vim-most-minimal-folds

  {
    "vim-utils/vim-most-minimal-folds",
    event = { "BufReadPost", "BufNewFile" },
    enabled = Is_Enabled("vim-most-minimal-folds"),
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ virtcolumn.nvim

  {
    "xiyaowong/virtcolumn.nvim",
    event = { "BufReadPost", "BufNewFile" },
    enabled = Is_Enabled("virtcolumn.nvim"),
  },

  -- ----------------------------------------------------------------------- }}}
}
