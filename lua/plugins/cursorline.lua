return {
  "ya2s/nvim-cursorline",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    cursorline = {
      enable = true,
      timeout = 0,
      number = true,
    },
    cursorword = {
      enable = true,
      min_length = 3,
      hl = { underline = true }, -- слово под курсором
    },
  },
  config = function(_, opts)
    require("nvim-cursorline").setup(opts)

    vim.api.nvim_set_hl(0, "CursorWord", { underline = true })
    vim.api.nvim_set_hl(0, "CursorWord0", { underline = true })
  end,
}

