local M = {
  "nvim-treesitter/nvim-treesitter-textobjects",
  branch = 'main',
}

local select_to = function(query_string)
  return require('nvim-treesitter-textobjects.select').select_textobject(query_string, "textobjects")
end

local selectmap = function (lhs, query_string)
  local rhs = function() select_to(query_string) end
  return {lhs, rhs, mode = {"x", "o" }, desc = query_string}
end

local selectmaps = function(t)
  local maps = {}
  for k,v in pairs(t) do
    table.insert(maps, selectmap(k, v))
  end
  return maps
end

M.keys = selectmaps({
  ["af"] = "@function.outer",
  ["if"] = "@function.inner",
  ["at"] = "@class.outer",
  ["it"] = "@class.inner",
  ["ac"] = "@call.outer",
  ["ic"] = "@call.inner",
  ["aa"] = "@parameter.outer",
  ["ia"] = "@parameter.inner",
  ["al"] = "@loop.outer",
  ["il"] = "@loop.inner",
  ["ai"] = "@conditional.outer",
  ["ii"] = "@conditional.inner",
  ["a/"] = "@comment.outer",
  ["i/"] = "@comment.inner",
  ["ab"] = "@block.outer",
  ["ib"] = "@block.inner",
  ["as"] = "@statement.outer",
  ["is"] = "@scopename.inner",
  ["aA"] = "@attribute.outer",
  ["iA"] = "@attribute.inner",
  ["aF"] = "@frame.outer",
  ["iF"] = "@frame.inner",
})

M.opts = {
  select = {
    lookahead = true,
    include_surrounding_whitespace = false,
    selection_modes = {
      ['@function.outer'] = 'V', -- linewise
    },
  },
  move = {
    set_jumps = true,
  },
}

return M
