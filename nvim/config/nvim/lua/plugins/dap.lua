return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "rcarriga/nvim-dap-ui", -- Añade esta dependencia
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui") -- Requiere dap-ui

      -- Configuración de dap-ui
      dapui.setup({
        layouts = {
          {
            elements = {
              { id = "scopes", size = 0.6 },
              { id = "breackpoints", size = 0.4 },
            },
            size = 40,
            position = "left",
          },
          {
            elements = {
              { id = "repl", size = 1.0 },
            },
            size = 10,
            position = "bottom",
          },
        },
      })

      -- Automáticamente abrir dap-ui cuando comienza la depuración
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end

      -- Automáticamente cerrar dap-ui cuando termina la depuración
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      -- Configuración del adaptador para Python
      dap.adapters.python = {
        type = "executable",
        command = "/home/juand/.virtualenvs/odoo17/bin/python",
        args = { "-m", "debugpy.adapter" },
      }

      -- Configuración de la configuración de depuración para Python
      dap.configurations.python = {
        {
          type = "python",
          request = "launch",
          name = "Odoo",
          program = "${workspaceFolder}/odoo/odoo-bin",
          args = {
            "--config=${workspaceFolder}/odoo.conf",
          },
          pythonPath = function()
            return "/home/juand/.virtualenvs/odoo17/bin/python3"
          end,
        },
      }
    end,
  },
}
