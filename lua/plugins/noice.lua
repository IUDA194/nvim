return {
  "folke/noice.nvim",
  event = "VeryLazy",

  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },

  opts = {
    -- включаем интеграцию с nvim-notify
    notify = {
      enabled = true,
      view = "mini", -- использовать наш mini-view
    },

    views = {
      mini = {
        position = {
          row = 1,   -- сверху
          col = -1,  -- -1 = привязка к правому краю
        },
        border = "rounded",
        timeout = 2000,
        size = {
          width = "auto",
          height = "auto",
        },
        win_options = {
          winblend = 0,
        },
      },
    },
  },

  config = function(_, opts)
    -- Фикс для сообщения "NotifyBackground has no background highlight"
    vim.api.nvim_set_hl(0, "NotifyBackground", { bg = "#000000" })

    -- Настройка nvim-notify (фон для 100% прозрачности и т.п.)
    local notify = require("notify")
    notify.setup({
      background_colour = "#000000",
    })
    -- чтобы все vim.notify шли через nvim-notify
    vim.notify = notify

    -- Запускаем noice с нашими опциями
    require("noice").setup(opts)
  end,
}

