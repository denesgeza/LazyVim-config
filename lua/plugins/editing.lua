Is_Enabled = require("config.functions").is_enabled

local bullets = "bullets.vim"
local plugin = "nvim-spectre"

return {
  -- {{{ bullets.nvim

  {
    "dkarter/" .. bullets,
    event = { "BufReadPost", "BufNewFile" },
    enabled = Is_Enabled(bullets),
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ nvim-spectre
  {
    "nvim-pack/" .. plugin,
    event = { "BufReadPost", "BufNewFile" },
    enabled = Is_Enabled(plugin),
    keys = {
      {
        "<leader>sr",
        function()
          require("spectre").open()
        end,
        desc = "Replace in files (Spectre)",
      },
    },
  },
  -- ----------------------------------------------------------------------- }}}
}
