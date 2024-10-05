local M = {
  "lewis6991/gitsigns.nvim",
  event = "BufEnter",
  cmd = "Gitsigns",
}
M.config = function()
  local hopts = {navigation_message = true}
  vim.keymap.set("n", "<leader>gj", function() require("gitsigns").next_hunk(hopts)  end, { desc = "Next Hunk"       })
  vim.keymap.set("n", "<leader>gk", function() require("gitsigns").prev_hunk(hopts)  end, { desc = "Prev Hunk"       })
  vim.keymap.set("n", "<leader>gl", function() require("gitsigns").blame_line()      end, { desc = "Blame"           })
  vim.keymap.set("n", "<leader>gp", function() require("gitsigns").preview_hunk()    end, { desc = "Preview Hunk"    })
  vim.keymap.set("n", "<leader>gr", function() require("gitsigns").reset_hunk()      end, { desc = "Reset Hunk"      })
  vim.keymap.set("n", "<leader>gR", function() require("gitsigns").reset_buffer()    end, { desc = "Reset Buffer"    })
  vim.keymap.set("n", "<leader>gs", function() require("gitsigns").stage_hunk()      end, { desc = "Stage Hunk"      })
  vim.keymap.set("n", "<leader>gu", function() require("gitsigns").undo_stage_hunk() end, { desc = "Undo Stage Hunk" })
  vim.keymap.set("n", "<leader>gd", function() require("gitsigns").diffthis('HEAD')  end, { desc = "Git Diff"        })

  local icons = require("user.icons")

  require("gitsigns").setup {
    signs = {
      add          = { text = icons.ui.BoldLineRight           },
      change       = { text = icons.ui.BoldLineRight           },
      delete       = { text = icons.ui.TriangleShortArrowRight },
      topdelete    = { text = icons.ui.TriangleShortArrowRight },
      changedelete = { text = icons.ui.BoldLineRight           },
    },
    watch_gitdir = {
      interval = 1000,
      follow_files = true,
    },
    attach_to_untracked = true,
    current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
    update_debounce = 200,
    max_file_length = 40000,
    preview_config = {
      border = "rounded",
      style = "minimal",
      relative = "cursor",
      row = 0,
      col = 1,
    },
  }
end

return M
