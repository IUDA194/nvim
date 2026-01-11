return {
  "tiagovla/tokyodark.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    transparent_background = true,
    gamma = 1.00,
  },
  config = function(_, opts)
    require("tokyodark").setup(opts)
    vim.opt.termguicolors = true
    vim.cmd("colorscheme tokyodark")

    local function apply_highlights()
      -- Визуальное выделение: заметно, но не “кислотно”
      -- (подходит под палитру TokyoDark)
      vim.api.nvim_set_hl(0, "Visual", {
        bg = "#2F3B55",
        fg = "NONE",
        bold = true,
      })
      vim.api.nvim_set_hl(0, "VisualNOS", {
        bg = "#2F3B55",
        fg = "NONE",
        bold = true,
      })

      -- Поиск: теплый акцент, хорошо заметен
      vim.api.nvim_set_hl(0, "Search", {
        bg = "#4A3F2A",
        fg = "NONE",
        bold = true,
      })
      vim.api.nvim_set_hl(0, "IncSearch", {
        bg = "#6B2D3A",
        fg = "NONE",
        bold = true,
      })

      -- Neovim 0.9+ : подсветка текущего совпадения
      pcall(vim.api.nvim_set_hl, 0, "CurSearch", {
        bg = "#8F5E15",
        fg = "#0B0F14",
        bold = true,
      })

      -- Чтобы курсор не терялся на прозрачном фоне
      vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1A1F2A" })
    end

    apply_highlights()

    -- Защита: любая тема/перезагрузка схемы не перетрёт наши hl
    local group = vim.api.nvim_create_augroup("UserTokyoDarkHighlights", { clear = true })
    vim.api.nvim_create_autocmd("ColorScheme", {
      group = group,
      pattern = "*",
      callback = apply_highlights,
    })
  end,
}

