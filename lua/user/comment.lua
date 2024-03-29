return {
  "numToStr/Comment.nvim",
  -- event = "VeryLazy",
  -- commit = "0236521ea582747b58869cb72f70ccfa967d2e89",
  keys = {
    {"<Plug>(comment_toggle_linewise_current)", mode = "n"},
    {"<Plug>(comment_toggle_linewise_visual)" , mode = "v"},
  },
  init = function()
    -- TODO: this does not cover block comment keymaps
    vim.keymap.set("n", "<leader>/", "<Plug>(comment_toggle_linewise_current)", { desc = 'Comment out current line'         })
    vim.keymap.set("v", "<leader>/", "<Plug>(comment_toggle_linewise_visual)" , { desc = 'Comment out visual-selected text' })
    -- Comment toggle linewise (normal)
    -- Comment toggle linewise (visual)
  end,
  config = function()
    require("Comment").setup {
      ---Add a space b/w comment and the line
      padding = true,
      ---Whether the cursor should stay at its position
      sticky = true,
      ---Lines to be ignored while (un)comment
      ignore = nil,
      ---LHS of toggle mappings in NORMAL mode
      toggler = {
        ---Line-comment toggle keymap
        line = "gcc",
        ---Block-comment toggle keymap
        block = "gbc",
      },
      ---LHS of operator-pending mappings in NORMAL and VISUAL mode
      opleader = {
        ---Line-comment keymap
        line = "gc",
        ---Block-comment keymap
        block = "gb",
      },
      ---LHS of extra mappings
      extra = {
        ---Add comment on the line above
        above = "gcO",
        ---Add comment on the line below
        below = "gco",
        ---Add comment at the end of line
        eol = "gcA",
      },
      ---Enable keybindings
      ---NOTE: If given `false` then the plugin won't create any mappings
      mappings = {
        ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
        basic = true,
        ---Extra mapping; `gco`, `gcO`, `gcA`
        extra = true,
      },
      ---Function to call before (un)comment
      pre_hook = function(ctx)
        local loaded, ts_comment = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
        if loaded and ts_comment then
          return ts_comment.create_pre_hook()(ctx)
        end
      end, -- require('Comment.ft').calculate
      ---Function to call after (un)comment
      post_hook = nil,
    }
  end
}
