-- {{{ markdown-perview.nvim
Constants = require("config.constants")
local functions = require("config.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

return
-- {{{ markdown-perview.nvim
{
  "iamcco/markdown-preview.nvim",
  ft = "md",
  enabled = Is_Enabled("markdown-preview.nvim"),
}

-- ----------------------------------------------------------------------- }}}
