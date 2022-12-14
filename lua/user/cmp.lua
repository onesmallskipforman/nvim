local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

require("luasnip/loaders/from_vscode").lazy_load()

local check_backspace = function()
  local col = vim.fn.col(".") - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

--   פּ ﯟ   some other good icons
local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}
-- find more here: https://www.nerdfonts.com/cheat-sheet

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
    end,
  },

  mapping = cmp.mapping.preset.insert({
    ["<Up>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.abort()
        vim.api.nvim_input("<Up>")
        -- local termcode = vim.api.nvim_replace_termcodes("<Up>", true, true, true)
        -- vim.api.nvim_feedkeys(termcode, 'in', true)
      else
        fallback()
      end
    end, {"i"}),
    ["<Down>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.abort()
        vim.api.nvim_input("<Down>")
        -- local termcode = vim.api.nvim_replace_termcodes("<Down>", true, true, true)
        -- vim.api.nvim_feedkeys(termcode, 'in', true)
      else
        fallback()
      end
    end, {"i"}),
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-e>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
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
      "c"
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
      "c"
    }),
  }),
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      vim_item.kind = kind_icons[vim_item.kind]
      vim_item.menu = ({
        path       = "[Path]",
        nvim_lsp   = "[LSP]",
        nvim_lua   = "[Lua]",
        luasnip    = "[Snippet]",
        buffer     = "[Buffer]",
        dictionary = "[Dictionary]",
      })[entry.source.name]
      return vim_item
    end,
  },
  sources = {
    { name = "path" },
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "luasnip" },
    {
      name = "buffer",
      option = {
        -- pull from all open buffers
        get_bufnrs = function()
          return vim.api.nvim_list_bufs()
        end
      }
    },
    { name = "dictionary" },
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
    -- documentation = {
    --   -- border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    --   winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
    -- },

    -- documentation = {
    --   border = "rounded",
    --   winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
    -- },
    -- completion = {
    --   border = "rounded",
    --   winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
    -- },

  },
  experimental = {
    ghost_text = true,
  },
})

-- require("cmp_dictionary").setup({
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
-- })

cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
