return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    signs = true, -- показывать значки в колонке
    keywords = {
      FIX = { icon = " ", color = "error" },
      TODO = { icon = " ", color = "info" },
      HACK = { icon = " ", color = "warning" },
      WARN = { icon = " ", color = "warning" },
      NOTE = { icon = " ", color = "hint" },
    },
  },
  config = function(_, opts)
    require("todo-comments").setup(opts)

    -- Горячая клавиша для поиска TODO
    vim.keymap.set("n", "<leader>td", ":TodoTelescope<CR>", { desc = "Find TODOs" })
  end,
}

