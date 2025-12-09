return {
  "tiagovla/tokyodark.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    transparent_background = true,  -- ✨ делает фон прозрачным
    gamma = 1.00,                   -- опционально: настройка яркости
  },
  config = function(_, opts)
    require("tokyodark").setup(opts)
    vim.cmd("colorscheme tokyodark")
  end,
}

