local M = {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  -- event = "InsertEnter",
  dependencies = {
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-emoji" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-cmdline" },
    { "saadparwaiz1/cmp_luasnip" },
    { "hrsh7th/cmp-cmdline" },
    { "hrsh7th/cmp-nvim-lua" },
    {
      "L3MON4D3/LuaSnip",
      dependencies = {
        "rafamadriz/friendly-snippets",
      },
    },
    -- TODO: dictionary completion is not working
    -- {
    --   "uga-rosa/cmp-dictionary",
    --   enable = false,
    --   -- config = function ()
    --   --   local dict = require("cmp_dictionary")
    --   --   dict.setup{
    --   --       -- dic = {
    --   --       --     ["*"] = "/usr/share/dict/words",
    --   --       --     ["markdown"] = { "path/to/mddict", "path/to/mddict2" },
    --   --       --     ["javascript,typescript"] = { "path/to/jsdict" },
    --   --       -- },
    --   --       -- The following are default values, so you don't need to write them if you don't want to change them
    --   --       exact = 2,
    --   --       async = false,
    --   --       capacity = 5,
    --   --       debug = false,
    --   --   }
    --   --
    --   --   dict.switcher({
    --   --     filetype = {
    --   --       -- lua = "/path/to/lua.dict",
    --   --       txt = "/usr/share/dict/words"
    --   --       -- javascript = { "/path/to/js.dict", "/path/to/js2.dict" },
    --   --     },
    --   --     -- filepath = {
    --   --     --   [".*xmake.lua"] = { "/path/to/xmake.dict", "/path/to/lua.dict" },
    --   --     --   ["%.tmux.*%.conf"] = { "/path/to/js.dict", "/path/to/js2.dict" },
    --   --     -- },
    --   --     -- spelllang = {
    --   --     --   en = "/path/to/english.dict",
    --   --     -- },
    --   --   })
    --   -- end
    -- },
  },
}

function M.config()
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
    -- performance = {
    --   debounce = 500,
    --   throttle = 550,
    --   fetching_timeout = 80,
    -- },
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
        -- c = cmp.mapping.close(),
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
      { name = "nvim_lua" },
      -- {
      --   name = "buffer",
      --   option = {
      --     -- pull from all open buffers
      --     get_bufnrs = function()
      --       return vim.api.nvim_list_bufs()
      --     end
      --   }
      -- },
      { name = "path" },
      { name = "calc" },
      { name = "emoji" },
      { name = "treesitter" },
      { name = "crates" },
      { name = "tmux" },
      -- { name = "dictionary" },
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

  -- NOTE: cmp cmdline causes issues with tab completion in cmd mode
  -- https://github.com/hrsh7th/nvim-cmp/issues/874#issuecomment-1090099590
  -- https://github.com/hrsh7th/cmp-cmdline/issues/52
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
      window = {
        completion = {
          border = "none",
          scrollbar = false,
          scrolloff = 8,
        },
      },
    sources = {
      { name = 'buffer' },
    }
  })
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    window = {
      completion = {
        border = "none",
        scrollbar = false,
        scrolloff = 8,
      },
    },
    sources = cmp.config.sources({
      { name = 'cmdline', priority = 2 },
      -- { name = 'cmdline', priority = 2, option = { ignore_cmds = { 'Man', '!', 's/', }} },
      -- { name = 'path'   , priority = 1 },
      -- { name = 'buffer' , priority = 1 }, -- things get messy with ':s', see https://github.com/hrsh7th/cmp-cmdline/issues/13 and https://github.com/hrsh7th/cmp-cmdline/issues/48
      -- { name = 'nvim_lsp' }, -- https://github.com/hrsh7th/cmp-cmdline/issues/106

    })
  })




    -- local dict = require("cmp_dictionary")
    -- dict.setup{
    --     -- dic = {
    --     --     ["*"] = "/usr/share/dict/words",
    --     --     ["markdown"] = { "path/to/mddict", "path/to/mddict2" },
    --     --     ["javascript,typescript"] = { "path/to/jsdict" },
    --     -- },
    --     -- The following are default values, so you don't need to write them if you don't want to change them
    --     exact = 2,
    --     async = false,
    --     capacity = 5,
    --     debug = false,
    -- }

    -- dict.switcher({
    --   filetype = {
    --     -- lua = "/path/to/lua.dict",
    --     ['*'] = "/usr/share/dict/words"
    --     -- javascript = { "/path/to/js.dict", "/path/to/js2.dict" },
    --   },
    --   -- filepath = {
    --   --   [".*xmake.lua"] = { "/path/to/xmake.dict", "/path/to/lua.dict" },
    --   --   ["%.tmux.*%.conf"] = { "/path/to/js.dict", "/path/to/js2.dict" },
    --   -- },
    --   -- spelllang = {
    --   --   en = "/path/to/english.dict",
    --   -- },
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
