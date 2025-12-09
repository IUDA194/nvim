vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })

return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
  },
  config = function()
    local telescope = require("telescope")

    telescope.setup({
      extensions = {
        file_browser = {
          theme = "ivy",
          hijack_netrw = true,
          mappings = {
            ["i"] = {
              -- insert mode mappings
            },
            ["n"] = {
              -- normal mode mappings
            },
          },
        },
      },
    })

    -- Загружаем расширение
    telescope.load_extension("file_browser")
  end,
}

