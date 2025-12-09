vim.keymap.set({ "n", "v" }, "<leader>F", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format file or range" })

return {
  "stevearc/conform.nvim",
  config = function()
  require("conform").setup({
    formatters_by_ft = {
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      json = { "prettier" },
      css = { "prettier" },
      html = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      python = { "ruff_format" },   -- ← вместо black
      rust = { "rustfmt" },
      cpp = { "clang_format" },
      c = { "clang_format" },
      text = { "trim_whitespace" },
    },
    format_on_save = false,
  })

  end,
}

