local M = {
  "nvim-lualine/lualine.nvim",
  commit = "7533b0ead663d80452210c0c089e5105089697e5",
}

function M.config()
  local sl_hl = vim.api.nvim_get_hl_by_name("StatusLine", true)
  vim.api.nvim_set_hl(0, "Copilot", { fg = "#6CC644", bg = sl_hl.background })
  local icons = require "user.icons"
  local diff = {
    "diff",
    colored = true,
    symbols = { added = icons.git.LineAdded, modified = icons.git.LineModified, removed = icons.git.LineRemoved }, -- Changes the symbols used by the diff.
  }

  local copilot = function()
    local buf_clients = vim.lsp.get_active_clients { bufnr = 0 }
    if #buf_clients == 0 then
      return "LSP Inactive"
    end

    local buf_client_names = {}
    local copilot_active = false

    for _, client in pairs(buf_clients) do
      if client.name ~= "null-ls" and client.name ~= "copilot" then
        table.insert(buf_client_names, client.name)
      end

      if client.name == "copilot" then
        copilot_active = true
      end
    end

    if copilot_active then
      return "%#Copilot#" .. icons.git.Octoface .. "%*"
    end
    return ""
  end

  require("lualine").setup {
    options = {
      -- component_separators = { left = "", right = "" },
      -- section_separators = { left = "", right = "" },
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },

      ignore_focus = { "NvimTree" },
    },
    sections = {
      -- lualine_a = { {"branch", icon =""} },
      -- lualine_b = { diff },
      -- lualine_c = { "diagnostics" },
      -- lualine_x = { copilot },
      -- lualine_y = { "filetype" },
      -- lualine_z = { "progress" },
      lualine_a = { "mode" },
      lualine_b = { "branch" },
      lualine_c = { diff },
      lualine_x = { "diagnostics", copilot },
      lualine_y = { "filetype" },
      lualine_z = { "progress" },
    },
    extensions = { "quickfix", "man", "fugitive" },
  }
end

return M


-- local status_ok, lualine = pcall(require, "lualine")
-- if not status_ok then
--   return
-- end
--
-- local hide_in_width = function()
--   return vim.fn.winwidth(0) > 80
-- end
--
-- local icons = require "user.icons"
--
-- local diagnostics = {
--   "diagnostics",
--   sources = { "nvim_diagnostic" },
--   sections = { "error", "warn" },
--   symbols = { error = icons.diagnostics.Error .. " ", warn = icons.diagnostics.Warning .. " " },
--   colored = false,
--   update_in_insert = false,
--   always_visible = true,
-- }
--
-- local diff = {
--   "diff",
--   colored = false,
--   symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
--   cond = hide_in_width,
-- }
--
-- local mode = {
--  "mode",
--  fmt = function(str)
--    return "-- " .. str .. " --"
--  end,
-- }
--
-- local filetype = {
--   "filetype",
--   icons_enabled = false,
--  -- icon = nil,
-- }
--
-- -- local branch = {
-- --   "branch",
-- --   icons_enabled = true,
-- --   icon = "",
-- -- }
-- --
-- local branch = {
--   "branch",
--   icons_enabled = true,
--   -- icon = "%#SLGitIcon#" .. "" .. "%*" .. "%#SLBranchName#",
--   -- color = "Constant",
--   colored = false,
-- }
--
-- local location = {
--   "location",
--   padding = { left = 0, right = 1 },
--   -- padding = 0,
-- }
--
-- local spaces = function()
--   return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
-- end
--
-- -- -- cool function for progress
-- -- local progress = function()
-- --   local current_line = vim.fn.line(".")
-- --   local total_lines = vim.fn.line("$")
-- --   local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
-- --   local line_ratio = current_line / total_lines
-- --   local index = math.ceil(line_ratio * #chars)
-- --   return chars[index]
-- -- end
--
-- lualine.setup {
--   options = {
--     globalstatus = true,
--     icons_enabled = true,
--     theme = "auto",
--     component_separators = { left = "", right = "" },
--     section_separators = { left = '', right = '' },
--     disabled_filetypes = { "alpha", "dashboard" },
--     always_divide_middle = true,
--   },
--   sections = {
--     lualine_a = { mode },
--     lualine_b = { branch },
--     lualine_c = { diagnostics },
--     lualine_x = { diff, spaces, "encoding", filetype },
--     lualine_y = { "progress" },
--     lualine_z = { location },
--   },
-- }
