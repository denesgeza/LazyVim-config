return {
  "phaazon/hop.nvim",
  as = "hop",
  branch = "v2",
  config = function()
    require("hop").setup({ keys = "asdfjkluiopnm" })
    vim.api.nvim_set_keymap("n", "s", ":HopWord<cr>", {})
    vim.api.nvim_set_keymap("n", "S", ":HopPattern<cr>", {})
  end,
}
