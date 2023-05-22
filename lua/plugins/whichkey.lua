Constants = require("config.constants")
local functions = require("config.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

-- {{{ Which-key
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  enabled = Is_Enabled("which-key.nvim"),
  keys = false,
}

-- ----------------------------------------------------------------------- }}}
