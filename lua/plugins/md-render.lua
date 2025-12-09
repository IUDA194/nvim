return {
  -- Красивое отображение Markdown
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "norg", "rmd", "org", "codecompanion" },
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    opts = {
      -- ваши настройки, например:
      -- preset = "lazy",
      -- checkbox = { enabled = true },
    },
  },
  -- Переход по Markdown ссылкам

    {
      "jghauser/follow-md-links.nvim",
      dependencies = { "nvim-treesitter/nvim-treesitter" },
      ft = { "markdown" },
      config = function()
        vim.keymap.set("n", "<CR>", require("follow-md-links").follow_link, { buffer = true })
        vim.keymap.set("n", "<BS>", ":edit #<CR>", { buffer = true, silent = true })
      end,
    },
}

