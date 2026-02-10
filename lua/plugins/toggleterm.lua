return {
  {
    "akinsho/toggleterm.nvim",
    version = "*", -- можно указать конкретную версию
    config = function()
      require("toggleterm").setup{
        size = 20,
        open_mapping = [[<c-\>]], -- Ctrl+\
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        persist_size = true,
        direction = "float", -- float terminal
        float_opts = {
          border = "rounded", -- стиль бордера
          winblend = 0,
        }
      }

      -- helper mapping: toggle terminal
      vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm<cr>", { desc = "Toggle float terminal" })
    end
  }
}

