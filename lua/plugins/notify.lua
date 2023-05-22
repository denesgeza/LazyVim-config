-- {{{ nvim-notify
Constants = require("config.constants")
local functions = require("config.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

return
-- {{{ nvim-notify
{
  "rcarriga/nvim-notify",
  enabled = Is_Enabled("nvim-notify"),
  opts = function(_, opts)
    if Use_Defaults("nvim-notify") then
      -- Use LazyVim default setup.
      opts = opts
    else
      opts.background_colour = "#1a1b26"
      opts.timeout = 1500
      opts.top_down = false
    end
  end,
}

-- ----------------------------------------------------------------------- }}}
