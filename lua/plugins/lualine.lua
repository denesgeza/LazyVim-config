Constants = require("config.constants")
local functions = require("config.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local colors = {

  red = "#ca1243",
  grey = "#a0a1a7",
  black = "#383a42",
  white = "#f3f3f3",
  light_green = "#83a598",
  orange = "#fe8019",
  green = "#8ec07c",
}

local theme = {
  normal = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.black, bg = colors.white },
    z = { fg = colors.white, bg = colors.black },
  },
  insert = { a = { fg = colors.black, bg = colors.light_green } },
  visual = { a = { fg = colors.black, bg = colors.orange } },
  replace = { a = { fg = colors.black, bg = colors.green } },
}
--
local empty = require("lualine.component"):extend()
function empty:draw(default_highlight)
  self.status = ""
  self.applied_separator = ""
  self:apply_highlights(default_highlight)
  self:apply_section_separators()
  return self.status
end
--
-- Put proper separators and gaps between components in sections
local function process_sections(sections)
  for name, section in pairs(sections) do
    local left = name:sub(9, 10) < "x"
    for pos = 1, name ~= "lualine_z" and #section or #section - 1 do
      table.insert(section, pos * 2, { empty, color = { fg = colors.white, bg = colors.white } })
    end
    for id, comp in ipairs(section) do
      if type(comp) ~= "table" then
        comp = { comp }
        section[id] = comp
      end
      comp.separator = left and { right = "" } or { left = "" }
    end
  end
  return sections
end

local function search_result()
  if vim.v.hlsearch == 0 then
    return ""
  end
  local last_search = vim.fn.getreg("/")
  if not last_search or last_search == "" then
    return ""
  end
  local searchcount = vim.fn.searchcount({ maxcount = 9999 })
  return last_search .. "(" .. searchcount.current .. "/" .. searchcount.total .. ")"
end

local function modified()
  if vim.bo.modified then
    return "+"
  elseif vim.bo.modifiable == false or vim.bo.readonly == true then
    return "-"
  end
  return ""
end

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  enabled = Is_Enabled("lualine.nvim"),
  opts = function(_, opts)
    if Use_Defaults("lualine.nvim") then
      -- Use LazyVim default setup.
      opts = opts
    else
      -- Use my customizations.
      opts.options = {
        icons_enabled = true,
        theme = "auto",
        -- component_separators = { left = "", right = "" },
        component_separators = "",
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          winbar = {},
          statusline = { "alpha", "dashboard" },
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
      }

      -- opts.sections = process_sections({
      opts.sections = {
        lualine_a = { "mode" },
        lualine_b = {
          "branch",
          "diff",
          {
            "diagnostics",
            source = { "nvim" },
            sections = { "error" },
            diagnostics_color = { error = { bg = colors.red, fg = colors.white } },
          },
          {
            "diagnostics",
            source = { "nvim" },
            sections = { "warn" },
            diagnostics_color = { warn = { bg = colors.orange, fg = colors.white } },
          },
        },
        lualine_c = {
          { "filename", file_status = false, path = 1 },
          { modified, color = { bg = colors.red } },
          {
            "%w",
            cond = function()
              return vim.wo.previewwindow
            end,
          },
          {
            "%r",
            cond = function()
              return vim.bo.readonly
            end,
          },
          {
            "%q",
            cond = function()
              return vim.bo.buftype == "quickfix"
            end,
          },
        },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { search_result, "progress" },
        lualine_z = { "%l:%c", "%L" },
      }
      -- })

      opts.inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      }

      opts.tabline = {}
      opts.winbar = {}
      opts.inactive_winbar = {}
      opts.extensions = {}
    end
  end,
}
