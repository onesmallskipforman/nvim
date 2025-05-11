local M = {
  "nvim-tree/nvim-tree.lua",
  cmd = "NvimTreeToggle",
  dependencies = { "nvim-tree/nvim-web-devicons", },
}

M.keys = {
  {"<leader>e", "<cmd>NvimTreeToggle<cr>", desc = 'Toggle NvimTree'}
}

local function my_on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)
  vim.keymap.set("n", "l"    , api.node.open.edit            , opts "Open")
  vim.keymap.set("n", "h"    , api.node.navigate.parent_close, opts "Close Directory")
  vim.keymap.set("n", "v"    , api.node.open.vertical        , opts "Open: Vertical Split")
  vim.keymap.del("n", "<C-k>", { buffer = bufnr })
  vim.keymap.set("n", "<S-k>", api.node.open.preview         , opts "Open Preview")
  vim.keymap.set('n', '?',     api.tree.toggle_help          , opts('Help'))

  -- vim.keymap.set('n', '<C-c>', require("nvim-tree.api").tree.change_root(vim.fn.expand('%:p:h')), opts("Change Dir to current file"))
end

local icons = require("user.icons")
M.opts = {
  on_attach = my_on_attach,
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  -- prefer_startup_root = true,
  view = {
    signcolumn = "yes",
    -- width = {
    --   padding = 0,
    -- },
  },
  renderer = {
    -- highlight_git = "name",
    -- highlight_diagnostics = "name",
    -- highlight_modified = "all",
    add_trailing = false,
    group_empty = false,
    full_name = false,
    highlight_opened_files = "none",
    root_folder_label = ":t",
    indent_width = 1,
    indent_markers = {
      enable = false,
      inline_arrows = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        none = " ",
      },
    },
    icons = {
      git_placement = "signcolumn",
      modified_placement = "signcolumn",
      diagnostics_placement = "signcolumn",
      padding = " ",
      symlink_arrow = " ➛ ",
      show = {
        folder_arrow = false,
        folder = true,
      },
      glyphs = {
        default = icons.ui.Text,
        symlink = icons.ui.FileSymlink,
        bookmark = icons.ui.BookMark,
        folder = {
          -- TODO: symlink folder icons appear to not be working
          -- symlink = icons.ui.FolderSymlink,
          -- symlink_open = icons.ui.FolderSymlink,
          arrow_closed = icons.ui.ChevronRight,
          arrow_open = icons.ui.ChevronShortDown,
          -- default = icons.ui.Folder,
          open = icons.ui.FolderOpen,
          empty = icons.ui.EmptyFolder,
          empty_open = icons.ui.EmptyFolderOpen,
        },
        git = {
          unstaged = icons.git.FileUnstaged,
          staged = icons.git.FileStaged,
          unmerged = icons.git.FileUnmerged,
          renamed = icons.git.FileRenamed,
          untracked = icons.git.FileUntracked,
          deleted = icons.git.FileDeleted,
          ignored = "", -- icons.git.FileIgnored,
        },
      },
    },
    special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
    symlink_destination = true,
  },
  git = {
   enable = true,
   ignore = true,
   timeout = 500,
  },
  filters = {
    git_ignored = false, -- show files that are listed in gitignore
  },
  update_focused_file = {
    enable = true,
    debounce_delay = 15,
    -- update_root = true, -- prevents jumping root when moving around filesystem (false matches vscode default behavior)
    -- TODO: find out command to manually change to another project (i think telescope Projects does the trick but it would be nice to make it more automatic based on current buffer)
    -- okay so project_nvim 'manual_mode = false' will change the project automatically, but i have to still reopen nvimtree to see the change and it does not change back for files not detected in a project
    -- probably better to do it manually with telescope
    ignore_list = {},
  },
  diagnostics = {
    enable = true,
    show_on_dirs = false,
    show_on_open_dirs = true,
    debounce_delay = 50,
    severity = {
      min = vim.diagnostic.severity.HINT,
      max = vim.diagnostic.severity.ERROR,
    },
    icons = {
      hint = icons.diagnostics.BoldHint,
      info = icons.diagnostics.BoldInformation,
      warning = icons.diagnostics.BoldWarning,
      error = icons.diagnostics.BoldError,
    },
  },
}

return M
