-- Configure colorschemes

local gbox_status_ok, gruvbox = pcall(require, "gruvbox")
if gbox_status_ok then
  -- setup must be called before loading the colorscheme
  -- Default options:
  gruvbox.setup({
    undercurl = true,
    underline = true,
    bold = true,
    italic = true,
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true, -- invert background for search, diffs, statuslines and errors
    contrast = "soft", -- can be "hard", "soft" or empty string
    overrides = {},
  })
end

-- Apply colorscheme
local colorscheme = "gruvbox"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
end

-- make sure vim-illuminate highlighting is aligned with lsp highlighting
if pcall(require, "illuminate") then
  -- consider using guibg from "CursorLine" highlight group
  vim.api.nvim_command [[ hi def IlluminatedWordText gui=underline guibg=#504945 ]]
  vim.api.nvim_command [[ hi def IlluminatedWordRead gui=underline guibg=#504945 ]]
  vim.api.nvim_command [[ hi def IlluminatedWordWrite gui=underline guibg=#504945 ]]
elseif vim.g.colors_name == 'gruvbox' then
  -- consider using guibg from "CursorLine" highlight group
  vim.api.nvim_command [[ hi! LspReferenceText  gui=underline guibg=#504945 ]]
  vim.api.nvim_command [[ hi! LspReferenceWrite gui=underline guibg=#504945 ]]
  vim.api.nvim_command [[ hi! LspReferenceRead  gui=underline guibg=#504945 ]]
elseif (vim.fn.hlexists("LspReferenceText") == 0) then
  vim.api.nvim_command [[ hi! link LspReferenceText  CursorLine ]]
  vim.api.nvim_command [[ hi! link LspReferenceWrite CursorLine ]]
  vim.api.nvim_command [[ hi! link LspReferenceRead  CursorLine ]]
end
