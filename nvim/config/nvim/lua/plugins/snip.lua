return {
  "L3MON4D3/LuaSnip",
  config = function()
    local ls = require("luasnip")

    require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets/odoo/" })

    -- Ctrl+l para expandir o saltar al siguiente punto
    vim.keymap.set({ "i", "s" }, "<C-l>", function()
      if ls.expandable() then
        ls.expand()
      elseif ls.jumpable(1) then
        ls.jump(1)
      end
    end, { silent = true })
  end,
}
