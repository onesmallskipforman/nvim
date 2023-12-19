-- TODO: figure out how to trigger search completion without previosly triggering cmp in-buffer
local M = {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  -- commit = "d3a3056204e1a9dbb7c7fe36c114dc43b681768c",
  dependencies = {
    {
      "hrsh7th/cmp-nvim-lsp",
      event = "InsertEnter",
      commit = "44b16d11215dce86f253ce0c30949813c0a90765",
    },
    {
      "hrsh7th/cmp-emoji",
      event = "InsertEnter",
      commit = "19075c36d5820253d32e2478b6aaf3734aeaafa0",
    },
    {
      "hrsh7th/cmp-buffer",
      event = "InsertEnter",
      commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa",
    },
    {
      "hrsh7th/cmp-path",
      event = "InsertEnter",
      commit = "91ff86cd9c29299a64f968ebb45846c485725f23",
    },
    {
      "hrsh7th/cmp-cmdline",
      event = "InsertEnter",
      commit = "8ee981b4a91f536f52add291594e89fb6645e451",
    },
    {
      "saadparwaiz1/cmp_luasnip",
      event = "InsertEnter",
      commit = "05a9ab28b53f71d1aece421ef32fee2cb857a843",
    },
    {
      "L3MON4D3/LuaSnip",
      event = "InsertEnter",
      commit = "80a8528f084a97b624ae443a6f50ff8074ba486b",
      dependencies = {
        "rafamadriz/friendly-snippets",
      },
    },
    {
      "hrsh7th/cmp-nvim-lua",
      commit = "f12408bdb54c39c23e67cab726264c10db33ada8",
    },
    {
      "uga-rosa/cmp-dictionary",
      config = function ()
        require("cmp_dictionary").setup{
            dic = {
                ["*"] = "/usr/share/dict/words",
                ["markdown"] = { "path/to/mddict", "path/to/mddict2" },
                ["javascript,typescript"] = { "path/to/jsdict" },
            },
            -- The following are default values, so you don't need to write them if you don't want to change them
            exact = 2,
            async = false,
            capacity = 5,
            debug = false,
        }
      end
    },
    {
      "hrsh7th/cmp-cmdline",
    },
  },
}

function M.config()
  vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
  vim.api.nvim_set_hl(0, "CmpItemKindTabnine", { fg = "#CA42F0" })
  vim.api.nvim_set_hl(0, "CmpItemKindCrate", { fg = "#F64D00" })
  vim.api.nvim_set_hl(0, "CmpItemKindEmoji", { fg = "#FDE030" })

  local cmp = require "cmp"
  local luasnip = require "luasnip"
  require("luasnip/loaders/from_vscode").lazy_load()
  require("luasnip").filetype_extend("typescriptreact", { "html" })

  local check_backspace = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
  end

  local icons = require "user.icons"

  cmp.setup {
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    mapping = cmp.mapping.preset.insert {
      ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
      ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
      ["<Down>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
      ["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
      ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
      -- ["<C-d>"] = cmp.mapping(cmp.mapping.close_docs(), {"i", "c"}),

      ['<C-d>'] = cmp.mapping(function()
        if cmp.visible_docs() then
          cmp.close_docs()
        else
          cmp.open_docs()
        end
      end, {"i"}),



      ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
      ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
      ["<C-e>"] = cmp.mapping {
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      },
      -- Accept currently selected item. If none selected, `select` first item.
      -- Set `select` to `false` to only confirm explicitly selected items.
      ["<CR>"] = cmp.mapping.confirm { select = true },
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expandable() then
          luasnip.expand()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif check_backspace() then
          fallback()
        else
          fallback()
        end
      end, {
        "i",
        "s",
        -- "c" -- TODO: this causes native cmd tab menu to not spawn after being in insert mode once
      }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, {
        "i",
        "s",
        -- "c" -- TODO: this causes native cmd tab menu to not spawn after being in insert mode once
      }),
    },
    formatting = {
      fields = { "kind", "abbr", "menu" },
      format = function(entry, vim_item)
        vim_item.kind = icons.kind[vim_item.kind]
        vim_item.menu = ({
          nvim_lsp = "[LSP]",
          nvim_lua = "[Lua]",
          luasnip = "[Snippet]",
          buffer = "[Buffer]",
          path = "[Path]",
          dictionary = "[Dictionary]",
        })[entry.source.name]
        -- if entry.source.name == "copilot" then
        --   vim_item.kind = icons.git.Octoface
        --   vim_item.kind_hl_group = "CmpItemKindCopilot"
        -- end
        --
        -- if entry.source.name == "cmp_tabnine" then
        --   vim_item.kind = icons.misc.Robot
        --   vim_item.kind_hl_group = "CmpItemKindTabnine"
        -- end
        --
        -- if entry.source.name == "crates" then
        --   vim_item.kind = icons.misc.Package
        --   vim_item.kind_hl_group = "CmpItemKindCrate"
        -- end
        --
        -- if entry.source.name == "lab.quick_data" then
        --   vim_item.kind = icons.misc.CircuitBoard
        --   vim_item.kind_hl_group = "CmpItemKindConstant"
        -- end
        --
        -- if entry.source.name == "emoji" then
        --   vim_item.kind = icons.misc.Smiley
        --   vim_item.kind_hl_group = "CmpItemKindEmoji"
        -- end

        return vim_item
      end,
    },
    sources = {
      { name = "copilot" },
      {
        name = "nvim_lsp",
        entry_filter = function(entry, ctx)
          local kind = require("cmp.types.lsp").CompletionItemKind[entry:get_kind()]
          if kind == "Snippet" and ctx.prev_context.filetype == "java" then
            return false
          end

          if ctx.prev_context.filetype == "markdown" then
            return true
          end

          if kind == "Text" then
            return false
          end

          return true
        end,
      },
      { name = "luasnip" },
      { name = "cmp_tabnine" },
      { name = "nvim_lua" },
      {
        name = "buffer",
        option = {
          -- pull from all open buffers
          get_bufnrs = function()
            return vim.api.nvim_list_bufs()
          end
        }
      },
      { name = "path" },
      { name = "calc" },
      { name = "emoji" },
      { name = "treesitter" },
      { name = "crates" },
      { name = "tmux" },
      { name = "dictionary" },
    },
    confirm_opts = {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },
    window = {
      completion = {
        border = "rounded",
        winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,FloatBorder:FloatBorder,Search:None",
        col_offset = -3,
        side_padding = 1,
        scrollbar = false,
        scrolloff = 8,
      },
      documentation = {
        border = "rounded",
        winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,Search:None",
      },
    },
    experimental = {
      ghost_text = true,
    },
  }

  -- require("cmp_dictionary").setup{
  --     dic = {
  --         ["*"] = "/usr/share/dict/words",
  --         ["markdown"] = { "path/to/mddict", "path/to/mddict2" },
  --         ["javascript,typescript"] = { "path/to/jsdict" },
  --     },
  --     -- The following are default values, so you don't need to write them if you don't want to change them
  --     exact = 2,
  --     async = false,
  --     capacity = 5,
  --     debug = false,
  -- }

  -- TODO: cmp cmdline causes issues with tab completion in cmd mode
  -- https://github.com/hrsh7th/nvim-cmp/issues/874#issuecomment-1090099590
  -- cmp.setup.cmdline('/', {
  --   mapping = cmp.mapping.preset.cmdline(),
  --   sources = {
  --     { name = 'buffer' }
  --   }
  -- })

  -- cmp.setup.cmdline(':', {
  --   mapping = cmp.mapping.preset.cmdline(),
  --   sources = cmp.config.sources({
  --     { name = 'path' }
  --   }, {
  --     { name = 'cmdline' }
  --   })
  -- })


  pcall(function()
    local function on_confirm_done(...)
      require("nvim-autopairs.completion.cmp").on_confirm_done()(...)
    end
    require("cmp").event:off("confirm_done", on_confirm_done)
    require("cmp").event:on("confirm_done", on_confirm_done)
  end)
end

return M













-- local cmp_status_ok, cmp = pcall(require, "cmp")
-- if not cmp_status_ok then
--   return
-- end
--
-- local snip_status_ok, luasnip = pcall(require, "luasnip")
-- if not snip_status_ok then
--   return
-- end
--
-- require("luasnip/loaders/from_vscode").lazy_load()
--
-- local check_backspace = function()
--   local col = vim.fn.col(".") - 1
--   return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
-- end
--
-- --   פּ ﯟ   some other good icons
-- local kind_icons = {
--   Text = "",
--   Method = "m",
--   Function = "",
--   Constructor = "",
--   Field = "",
--   Variable = "",
--   Class = "",
--   Interface = "",
--   Module = "",
--   Property = "",
--   Unit = "",
--   Value = "",
--   Enum = "",
--   Keyword = "",
--   Snippet = "",
--   Color = "",
--   File = "",
--   Reference = "",
--   Folder = "",
--   EnumMember = "",
--   Constant = "",
--   Struct = "",
--   Event = "",
--   Operator = "",
--   TypeParameter = "",
-- }
-- -- find more here: https://www.nerdfonts.com/cheat-sheet
--
-- cmp.setup({
--   snippet = {
--     expand = function(args)
--       luasnip.lsp_expand(args.body) -- For `luasnip` users.
--     end,
--   },
--
--   mapping = cmp.mapping.preset.insert({
--     ["<Up>"] = cmp.mapping(function(fallback)
--       if cmp.visible() then
--         cmp.abort()
--         vim.api.nvim_input("<Up>")
--         -- local termcode = vim.api.nvim_replace_termcodes("<Up>", true, true, true)
--         -- vim.api.nvim_feedkeys(termcode, 'in', true)
--       else
--         fallback()
--       end
--     end, {"i"}),
--     ["<Down>"] = cmp.mapping(function(fallback)
--       if cmp.visible() then
--         cmp.abort()
--         vim.api.nvim_input("<Down>")
--         -- local termcode = vim.api.nvim_replace_termcodes("<Down>", true, true, true)
--         -- vim.api.nvim_feedkeys(termcode, 'in', true)
--       else
--         fallback()
--       end
--     end, {"i"}),
--     ["<C-k>"] = cmp.mapping.select_prev_item(),
--     ["<C-j>"] = cmp.mapping.select_next_item(),
--     ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
--     ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
--     ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
--     ["<C-e>"] = cmp.mapping({
--       i = cmp.mapping.abort(),
--       c = cmp.mapping.close(),
--     }),
--     -- Accept currently selected item. If none selected, `select` first item.
--     -- Set `select` to `false` to only confirm explicitly selected items.
--     ["<CR>"] = cmp.mapping.confirm({ select = true }),
--     ["<Tab>"] = cmp.mapping(function(fallback)
--       if cmp.visible() then
--         cmp.select_next_item()
--       elseif luasnip.expandable() then
--         luasnip.expand()
--       elseif luasnip.expand_or_jumpable() then
--         luasnip.expand_or_jump()
--       elseif check_backspace() then
--         fallback()
--       else
--         fallback()
--       end
--     end, {
--       "i",
--       "s",
--       "c"
--     }),
--     ["<S-Tab>"] = cmp.mapping(function(fallback)
--       if cmp.visible() then
--         cmp.select_prev_item()
--       elseif luasnip.jumpable(-1) then
--         luasnip.jump(-1)
--       else
--         fallback()
--       end
--     end, {
--       "i",
--       "s",
--       "c"
--     }),
--   }),
--   formatting = {
--     fields = { "kind", "abbr", "menu" },
--     format = function(entry, vim_item)
--       vim_item.kind = kind_icons[vim_item.kind]
--       vim_item.menu = ({
--         path       = "[Path]",
--         nvim_lsp   = "[LSP]",
--         nvim_lua   = "[Lua]",
--         luasnip    = "[Snippet]",
--         buffer     = "[Buffer]",
--         dictionary = "[Dictionary]",
--       })[entry.source.name]
--       return vim_item
--     end,
--   },
--   sources = {
--     { name = "path" },
--     { name = "nvim_lsp" },
--     { name = "nvim_lua" },
--     { name = "luasnip" },
--     {
--       name = "buffer",
--       option = {
--         -- pull from all open buffers
--         get_bufnrs = function()
--           return vim.api.nvim_list_bufs()
--         end
--       }
--     },
--     { name = "dictionary" },
--   },
--   confirm_opts = {
--     behavior = cmp.ConfirmBehavior.Replace,
--     select = false,
--   },
--   window = {
--     -- completion = cmp.config.window.bordered(),
--     -- documentation = cmp.config.window.bordered(),
--     -- documentation = {
--     --   -- border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
--     --   winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
--     -- },
--
--     -- documentation = {
--     --   border = "rounded",
--     --   winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
--     -- },
--     -- completion = {
--     --   border = "rounded",
--     --   winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
--     -- },
--
--   },
--   experimental = {
--     ghost_text = true,
--   },
-- })
--

-- cmp.setup.cmdline('/', {
--   mapping = cmp.mapping.preset.cmdline(),
--   sources = {
--     { name = 'buffer' }
--   }
-- })
--
-- cmp.setup.cmdline(':', {
--   mapping = cmp.mapping.preset.cmdline(),
--   sources = cmp.config.sources({
--     { name = 'path' }
--   }, {
--     { name = 'cmdline' }
--   })
-- })
