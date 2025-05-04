return {
  "stevearc/conform.nvim",
  opts = {
    -- Define your formatters
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", "black" },
      javascript = { "prettierd", "prettier", stop_after_first = true },
      xml = { "xmlformatter" },
    },
    -- Set default options
    default_format_opts = {
      lsp_format = "fallback",
    },
    -- Set up format-on-save
    format_on_save = { timeout_ms = 500 },
    -- Customize formatters
    formatters = {
      black = {
        prepend_args = { "--line-length", "140" },
      },
      shfmt = {
        prepend_args = { "-i", "2" },
      },
      xmlformatter = {
        prepend_args = { "--indent", 4 },
      },
    },
  },
}
