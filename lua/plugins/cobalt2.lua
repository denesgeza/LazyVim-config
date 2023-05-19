return {
  "lalitmee/cobalt2.nvim",
  lazy = true,
  -- event = { "ColorSchemePre" }, -- if you want to lazy load
  dependencies = { "tjdevries/colorbuddy.nvim" },
  config = function()
    require("colorbuddy").colorscheme("cobalt2")
  end,
}
