local M = {
  "mfussenegger/nvim-dap",
  commit = "6b12294a57001d994022df8acbe2ef7327d30587",
  event = "VeryLazy",
}

function M.config()

  local dap = require("dap")
  vim.keymap.set("n", "<leader>dt", function() dap.toggle_breakpoint() end, { desc = "Toggle Breakpoint" })
  vim.keymap.set("n", "<leader>db", function() dap.step_back() end, { desc = "Step Back" })
  vim.keymap.set("n", "<leader>dc", function() dap.continue() end, { desc = "Continue" })
  vim.keymap.set("n", "<leader>dC", function() dap.run_to_cursor() end, { desc = "Run To Cursor" })
  vim.keymap.set("n", "<leader>dd", function() dap.disconnect() end, { desc = "Disconnect" })
  vim.keymap.set("n", "<leader>dg", function() dap.session() end, { desc = "Get Session" })
  vim.keymap.set("n", "<leader>di", function() dap.step_into() end, { desc = "Step Into" })
  vim.keymap.set("n", "<leader>do", function() dap.step_over() end, { desc = "Step Over" })
  vim.keymap.set("n", "<leader>du", function() dap.step_out() end, { desc = "Step Out" })
  vim.keymap.set("n", "<leader>dp", function() dap.pause() end, { desc = "Pause" })
  vim.keymap.set("n", "<leader>dr", function() dap.repl.toggle() end, { desc = "Toggle Repl" })
  vim.keymap.set("n", "<leader>ds", function() dap.continue() end, { desc = "Start" })
  vim.keymap.set("n", "<leader>dq", function() dap.close() end, { desc = "Quit" })
  vim.keymap.set("n", "<leader>dU", function() require'dapui'.toggle({reset = true}) end, { desc = "Toggle UI" })

  local dap_ui_status_ok, dapui = pcall(require, "dapui")
  if not dap_ui_status_ok then
    return
  end

  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end

  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end

  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end

  dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
      -- provide the absolute path for `codelldb` command if not using the one installed using `mason.nvim`
      command = "codelldb",
      args = { "--port", "${port}" },
      -- On windows you may have to uncomment this:
      -- detached = false,
    },
  }
  dap.configurations.c = {
    {
      name = "Launch file",
      type = "codelldb",
      request = "launch",
      program = function()
        local path
        vim.ui.input({ prompt = "Path to executable: ", default = vim.loop.cwd() .. "/build/" }, function(input)
          path = input
        end)
        vim.cmd [[redraw]]
        return path
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
    },
  }
end

M = {
  "ravenxrz/DAPInstall.nvim",
  commit = "8798b4c36d33723e7bba6ed6e2c202f84bb300de",
  config = function()
    require("dap_install").setup {}
    require("dap_install").config("python", {})
  end,
}

return M
