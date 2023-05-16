return {
  "declancm/maximize.nvim",
  opts = {
    default_keymaps = false,
  },
  config = function()
    require("maximize").setup({
      default_keymaps = false,
    })
  end,
}
