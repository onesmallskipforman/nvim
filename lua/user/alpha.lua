local M = {
  "goolord/alpha-nvim",
  event = "VimEnter",
  commit = "234822140b265ec4ba3203e3e0be0e0bb826dff5",
}

-- turn off tabline for alpha
-- function M.init()
--   vim.api.nvim_create_autocmd("User", { pattern = "AlphaReady",
--     callback = function()
--       vim.opt.showtabline = 0
--     end,
--   })
--
--   vim.api.nvim_create_autocmd("User", { pattern = "AlphaClosed",
--     callback = function()
--       vim.opt.showtabline = 2
--     end,
--   })
-- end

function M.config()

  vim.keymap.set("n", "<leader>a", "<cmd>Alpha<cr>", { desc = 'Alpha' })

  local dashboard = require "alpha.themes.dashboard"
  local icons = require "user.icons"

  local function button(sc, txt, keybind, keybind_opts)
    local b = dashboard.button(sc, txt, keybind, keybind_opts)
    b.opts.hl_shortcut = "Macro"
    return b
  end



  dashboard.section.header.val = {
    '                                                              ',
    '                                                              ',
    '                                                              ',
    '                                                              ',
    '    ⢀⣀⣤⣤⣤⠤⢤⣤⣤⣤⣤⣄⣀⡀           ⢀⣠⣤⣄⡀            ⣀⣀⣀⣤⣤⣤⣤⣤⣤⣤⣤⣀⡀   ',
    ' ⢀⣤⠚⠩⠁⡄ ⠠⣤⠒⠒⣂ ⢈⣨⣭⣿⠛⠶⣦⣤⣄⡀   ⢠⣾⡟⠉⠉⠝⠿⠇    ⢀⣠⡤⠔⠒⣻⠟⠋⠩⠉⢁⣀⡀  ⣶  ⠙⡛⠷  ',
    ' ⠸⢟⡠⠒⢊⡤  ⠋⣠ ⠈⣉⣉⣉⣉⣀⣛⣿⡒⠭⡿⢿⣷⣤⣤⣀⣽⣇⣴⠆⣴⡃⢀⣠⣤⠴⣚⣫⡥ ⠒⠛⠁⣀⣉⣉⣙⢏⡉  ⢀⣼⣤⣜⠳⡦⠂  ',
    '   ⠐⠚⠫⣤⠖⢣⣤⡕ ⠉⣩⣤⠔ ⠂⣋⣭⣥⣤⠴⠛⣛⠈⢩⣿⠿⠛⢉  ⡐⠞⠫⢍⠙⣓⠢⠴⣥⣍⣙⠛⢓⡢⢤⣬⠉⠅ ⣤⡜⢛⠻⠛⠉⠁   ',
    '      ⠘⢔⢎⣡⡔⠂⣠⡿⠁⠒⢛⡻⢛⣩⠅  ⠉  ⠚⣯⣄⢠⣿⢀⣾⠇ ⠓ ⠁⠂⠈⠍⠐⠈⡉⣿⠛⣛⠛⠉⣤⣰⣿⣿⡟⠛⠁      ',
    '        ⠙⠛⠐⠚⠋ ⠒⣲⡿⠇⣋        ⢺⡏⠈⣀ ⠉⠈        ⠙⢿⠟⢰⣖⡢ ⠂⠒⠚⠉         ',
    '             ⣴⠛⠅⢀⣾⠟⢃       ⢹⠃⠠⠁⠈⠩         ⢠⣿ ⣀⢹⣿⡷             ',
    '             ⢿⣤⢚⣫⠅         ⢸⠇ ⢚ ⢀         ⣸⡇ ⠉⣿⣿⠇             ',
    '             ⠈⠛⢻⣥⡚⠔⣠⢣⣄⡀    ⢸⡇ ⢘ ⠈ ⠠⠈    ⣀⣰⡿⣧⣄⠾⠋⠁              ',
    '                ⠈⠑⠁        ⠘⣿⡀⣈⣀    ⠈  ⠈⠙⠁                    ',
    '                            ⠘⣷⠁                               ',
    '                             ⠙⣤                               ',
    '                              ⠛⠂                              ',
    '                                                              ',
  }

  dashboard.section.header.val = {
    [[                       ,;    t#,                                        ]],
    [[                     f#i    ;##W.              t                        ]],
    [[ L.                .E#t    :#L:WE              Ej            ..       : ]],
    [[ EW:        ,ft   i#W,    .KG  ,#D  t      .DD.E#,          ,W,     .Et ]],
    [[ E##;       t#E  L#D.     EE    ;#f EK:   ,WK. E#t         t##,    ,W#t ]],
    [[ E###t      t#E:K#Wfff;  f#.     t#iE#t  i#D   E#t        L###,   j###t ]],
    [[ E#fE#f     t#Ei##WLLLLt :#G     GK E#t j#f    E#t      .E#j##,  G#fE#t ]],
    [[ E#t D#G    t#E .E#L      ;#L   LW. E#tL#i     E#t     ;WW; ##,:K#i E#t ]],
    [[ E#t  f#E.  t#E   f#E:     t#f f#:  E#WW,      E#t    j#E.  ##f#W,  E#t ]],
    [[ E#t   t#K: t#E    ,WW;     f#D#;   E#K:       E#t  .D#L    ###K:   E#t ]],
    [[ E#t    ;#W,t#E     .D#;     G#t    ED.        E#t :K#t     ##D.    E#t ]],
    [[ E#t     :K#D#E       tt      t     t          E#t ...      #G      ..  ]],
    [[ E#t      .E##E                                ,;.          j           ]],
    [[ ..         G#E                                                         ]],
    [[             fE                                                         ]],
    [[              ,                                                         ]],
  }

  dashboard.section.header.val = {
    [[   ooooo      ooo                     oooooo     oooo  o8o                      ]],
    [[   `888b.     `8'                      `888.     .8'   `"'                      ]],
    [[    8 `88b.    8   .ooooo.   .ooooo.    `888.   .8'   oooo  ooo. .oo.  .oo.     ]],
    [[    8   `88b.  8  d88' `88b d88' `88b    `888. .8'    `888  `888P"Y88bP"Y88b    ]],
    [[    8     `88b.8  888ooo888 888   888     `888.8'      888   888   888   888    ]],
    [[    8       `888  888    .o 888   888      `888'       888   888   888   888    ]],
    [[   o8o        `8  `Y8bod8P' `Y8bod8P'       `8'       o888o o888o o888o o888o   ]],
    [[                                                                                ]],
    [[                                                                                ]],
    [[                     ┌──────────────┐      ┌──────────────┐                     ]],
    [[ r(t)       e(t)     │              │u(t)  │              │ y(t)                ]],
    [[─────────►X─────────►│  Skipper's   ├─────►│   NeoVim     ├──────────┬─────────►]],
    [[          ▲          │              │      │              │          │          ]],
    [[          │          └──────────────┘      └──────────────┘          │          ]],
    [[          │                                                          │          ]],
    [[          │                                                          │          ]],
    [[          │                     ┌──────────────┐                     │          ]],
    [[          │              y_m(t) │              │                     │          ]],
    [[          └─────────────────────┤    Config    │◄────────────────────┘          ]],
    [[                                │              │                                ]],
    [[                                └──────────────┘                                ]],
    -- [[                                                                                ]],
    -- [[                  A NeoVim Config by Skipper, Controls Engineer                 ]]
  }



  dashboard.section.buttons.val = {
    button("f", icons.ui.Files .. " Find file", ":Telescope find_files <CR>"),
    button("n", icons.ui.NewFile .. " New file", ":ene <BAR> startinsert <CR>"),
    -- button("s", icons.ui.SignIn .. " Load session", ":lua require('persistence').load()<CR>"),
    -- button("p", icons.git.Repo .. " Find project", ":lua require('telescope').extensions.projects.projects()<CR>"),
    button("w", icons.git.Repo .. " Find Workspace", ":lua require('telescope').extensions.workspaces.workspaces()<CR>"),
    button("r", icons.ui.History .. " Recent files", ":Telescope oldfiles <CR>"),
    button("t", icons.ui.Text .. " Find text", ":Telescope live_grep <CR>"),
    button("c", icons.ui.Gear .. " Config", ":e ~/.config/nvim/init.lua <CR>"),
    button("q", icons.ui.SignOut .. " Quit", ":qa<CR>"),
  }
  local function footer()
    return "github.com/onesmallskipforman"
    -- local version = vim.version()
    -- local nvim_version_info = "  Neovim v" .. version.major .. "." .. version.minor .. "." .. version.patch
  end

  dashboard.section.footer.val = footer()

  dashboard.section.header.opts.hl = "String"
  dashboard.section.buttons.opts.hl = "Macro"
  dashboard.section.footer.opts.hl = "Type"

  dashboard.opts.opts.noautocmd = true
  require("alpha").setup(dashboard.opts)

  vim.api.nvim_create_autocmd("User", {
    pattern = "LazyVimStarted",
    callback = function()
      local stats = require("lazy").stats()
      local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
      dashboard.section.footer.val = "Loaded " .. stats.count .. " plugins in " .. ms .. "ms"
      pcall(vim.cmd.AlphaRedraw)
    end,
  })

  vim.api.nvim_create_autocmd({ "User" }, {
    pattern = { "AlphaReady" },
    callback = function()
      vim.cmd [[
      set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3
    ]]
    end,
  })
end

return M
