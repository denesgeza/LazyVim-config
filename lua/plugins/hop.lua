return {
  "phaazon/hop.nvim",
  name = "hop",
  branch = "v2",
  config = function()
    require("hop").setup({
      keys = "asdfjkluiopnm",
    })
  end,
}
