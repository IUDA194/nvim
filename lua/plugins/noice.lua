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
          winblend = 15,
        },
      },
      cmdline_popup = {
        win_options = {
          winblend = 15,
        },
      },
      popupmenu = {
        win_options = {
          winblend = 15,
        },
      },
    },
  },

  config = function(_, opts)
    -- Не задаем сплошной фон, чтобы окно оставалось прозрачным.
    vim.api.nvim_set_hl(0, "NotifyBackground", { bg = "NONE" })

    local notify = require("notify")
    notify.setup({})
    -- чтобы все vim.notify шли через nvim-notify
    vim.notify = notify

    -- Запускаем noice с нашими опциями
    require("noice").setup(opts)
  end,
}
