local M = {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-lua/plenary.nvim" },
    -- { "ahmedkhalf/project.nvim" },
    { "natecraddock/workspaces.nvim" },
  },
  cmd = "Telescope",
}

function M.init()
  -- vim.keymap.set("n", "<leader>P" , "<cmd>Telescope projects<cr>"    , { desc = "Projects"})
  -- vim.keymap.set("n", "<leader>sp" , "<cmd>lua require('telescope').extensions.projects.projects()<cr>"    , { desc = "Projects"})
  vim.keymap.set("n", "<leader>sw" , "<cmd>lua require('telescope').extensions.workspaces.workspaces()<cr>"    , { desc = "Workspaces"})
  -- vim.keymap.set("n", "<leader>si" , "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>"    , { desc = "Media"}) -- requires https://github.com/nvim-telescope/telescope-media-files.nvim
  vim.keymap.set("n", "<leader>F" , "<cmd>Telescope live_grep<cr>"   , { desc = 'Live Grep'})
  -- vim.keymap.set("n", "<leader>t" , "<cmd>Telescope live_grep<cr>"   , { desc = 'Find Text'         })
  vim.keymap.set("n", "<leader>f" , "<cmd>Telescope find_files<cr>"  , { desc = 'Find Files'})
  vim.keymap.set("n", "<leader>b" , "<cmd>Telescope buffers<cr>"     , { desc = "Buffers"})
  vim.keymap.set("n", "<leader>sl", "<cmd>Telescope resume<cr>"    , { desc = "Last Search"})
  vim.keymap.set("n", "<leader>sF", "<cmd>Telescope grep_string<cr>"   , { desc = 'Find String Under Cursor'})
  vim.keymap.set("n", "<leader>sb", "<cmd>Telescope git_branches<cr>", { desc = "Checkout branch"})
  vim.keymap.set("n", "<leader>sc", "<cmd>Telescope colorscheme<cr>" , { desc = "Colorscheme"})
  vim.keymap.set("n", "<leader>sh", "<cmd>Telescope help_tags<cr>"   , { desc = "Vim Help Pages"})
  vim.keymap.set("n", "<leader>sH", "<cmd>Telescope highlights<cr>"   , { desc = "Highlight Groups"})
  vim.keymap.set("n", "<leader>sM", "<cmd>Telescope man_pages<cr>"   , { desc = "Man Pages"})
  vim.keymap.set("n", "<leader>sr", "<cmd>Telescope oldfiles<cr>"    , { desc = "Open Recent File"  })
  -- vim.keymap.set("n", "<leader>sr", "<cmd>Telescope oldfiles<cr>"    , { desc = "Recent File"  })
  vim.keymap.set("n", "<leader>sR", "<cmd>Telescope registers<cr>"   , { desc = "Registers"})
  vim.keymap.set("n", "<leader>sk", "<cmd>Telescope keymaps<cr>"     , { desc = "Keymaps"})
  vim.keymap.set("n", "<leader>sC", "<cmd>Telescope commands<cr>"    , { desc = "Commands"})

  vim.keymap.set("n", "<leader>go", "<cmd>Telescope git_status<cr>"  , { desc = "Open changed file" })
  vim.keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", { desc = "Checkout branch"})
  vim.keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>" , { desc = "Checkout commit"})
  vim.keymap.set("n", "<leader>gC", "<cmd>Telescope git_bcommits<cr>", { desc = "Checkout commit(for current file)"})

  vim.keymap.set("n", "<leader>ld", "<cmd>Telescope lsp_document_diagnostics<cr>", { desc = "Document Diagnostics" })
  vim.keymap.set("n", "<leader>lw", "<cmd>Telescope lsp_workspace_diagnostics<cr>", { desc = "Workspace Diagnostics" })
  vim.keymap.set("n", "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "Document Symbols" })
  vim.keymap.set("n", "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", { desc = "Workspace Symbols" })
  vim.keymap.set("n", "<leader>ld", "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", { desc = "Buffer Diagnostics" })
  vim.keymap.set("n", "<leader>lw", "<cmd>Telescope diagnostics<cr>", { desc = "Diagnostics" })
  vim.keymap.set("n", "<leader>le", "<cmd>Telescope quickfix<cr>", { desc = "Telescope Quickfix" })

  -- vim.keymap.set("n", "<leader>tt",
  --   "<cmd>lua require('telescope').extensions['telescope-tabs'].list_tabs(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal', prompt_title='Tabs'})<cr>",
  --   { desc = "Find Tab" })
end

function M.config()
  local icons = require "user.icons"
  local actions = require "telescope.actions"

  require("telescope").setup {
    defaults = {
      prompt_prefix = icons.ui.Telescope .. " ",
      selection_caret = icons.ui.Forward .. " ",
      entry_prefix = "   ",
      initial_mode = "insert",
      selection_strategy = "reset",
      path_display = { "smart" },
      color_devicons = true,
      set_env = { ["COLORTERM"] = "truecolor" },
      sorting_strategy = nil,
      layout_strategy = nil,
      layout_config = {},
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
        "--glob=!.git/",
      },

      mappings = {
        i = {
          ["<C-n>"] = actions.cycle_history_next,
          ["<C-p>"] = actions.cycle_history_prev,

          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
        },
        n = {
          ["<esc>"] = actions.close,
          ["j"] = actions.move_selection_next,
          ["k"] = actions.move_selection_previous,
          ["q"] = actions.close,
        },
      },
    },
    pickers = {
      live_grep = {
        theme = "dropdown",
        -- theme = "ivy",
      },

      grep_string = {
        theme = "dropdown",
      },

      find_files = {
        theme = "dropdown",
        previewer = false,
--       hidden = true,
--       no_ignore = true
      },

      buffers = {
        theme = "dropdown",
        previewer = false,
        initial_mode = "normal",
        mappings = {
          i = {
            ["<C-d>"] = actions.delete_buffer,
          },
          n = {
            ["dd"] = actions.delete_buffer,
          },
        },
      },

      planets = {
        show_pluto = true,
        show_moon = true,
      },

      colorscheme = {
        enable_preview = true,
      },

      lsp_references = {
        theme = "dropdown",
        initial_mode = "normal",
      },

      lsp_definitions = {
        theme = "dropdown",
        initial_mode = "normal",
      },

      lsp_declarations = {
        theme = "dropdown",
        initial_mode = "normal",
      },

      lsp_implementations = {
        theme = "dropdown",
        initial_mode = "normal",
      },
    },
    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      },
    },
  }
  -- require('telescope').load_extension('projects')
  require('telescope').load_extension('workspaces')
  require('telescope').load_extension('fzf')
end

return M
