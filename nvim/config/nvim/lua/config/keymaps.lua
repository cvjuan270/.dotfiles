-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = LazyVim.safe_keymap_set
local ls = require("luasnip")

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Acentos
keymap.set("i", ",a", "á", opts)
keymap.set("i", ",e", "é", opts)
keymap.set("i", ",i", "í", opts)
keymap.set("i", ",o", "ó", opts)
keymap.set("i", ",u", "ú", opts)
keymap.set("i", ",n", "ñ", opts)
keymap.set("i", ",N", "Ñ", opts)

-- DAP
keymap.set("n", "<F5>", function()
  require("dap").continue() -- Iniciar/continuar depuración
end, { desc = "Iniciar/continuar depuración" })

keymap.set("n", "<F9>", function()
  require("dap").toggle_breakpoint() -- Alternar punto de interrupción
end, { desc = "Alternar punto de interrupción" })

keymap.set("n", "<F10>", function()
  require("dap").step_over() -- Paso por procedimiento (step over)
end, { desc = "Paso por procedimiento (step over)" })

keymap.set("n", "<F11>", function()
  require("dap").step_into() -- Paso a paso (step into)
end, { desc = "Paso a paso (step into)" })

keymap.set("n", "<F12>", function()
  require("dap").step_out() -- Paso para salir (step out)
end, { desc = "Paso para salir (step out)" })

-- Abrir/cerrar la interfaz de depuración (dap-ui)
keymap.set("n", "<leader>du", function()
  require("dapui").toggle() -- Mostrar/ocultar ventanas de depuración
end, { desc = "Alternar interfaz de depuración" })

-- Atajos adicionales útiles
keymap.set("n", "<leader>dr", function()
  require("dap").repl.open() -- Abrir REPL de depuración
end, { desc = "Abrir REPL de depuración" })

keymap.set("n", "<leader>dt", function()
  require("dap").terminate() -- Detener depuración
end, { desc = "Detener depuración" })

-- END DAP
-- Ctrl+l para expandir o saltar al siguiente punto
-- map({ "i", "s" }, "<C-l>", function()
--   if ls.expandable() then
--     ls.expand()
--   elseif ls.jumpable(1) then
--     ls.jump(1)
--   end
-- end, { silent = true })

-- Ctrl+h para saltar al punto anterior
-- map({ "i", "s" }, "<C-h>", function()
--   if ls.jumpable(-1) then
--     ls.jump(-1)
--   end
-- end, { silent = true })
