return {
  "rebelot/kanagawa.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    transparent = true,
  },
  config = function(_, opts)
    require("kanagawa").setup(opts)
    vim.opt.termguicolors = true
    vim.cmd("colorscheme kanagawa")

    local function apply_highlights()
      local fish = {
        foreground = "#DCD7BA",
        selection = "#2D4F67",
        comment = "#727169",
        red = "#C34043",
        orange = "#FF9E64",
        yellow = "#C0A36E",
        green = "#76946A",
        purple = "#957FB8",
        cyan = "#7AA89F",
        pink = "#D27E99",
      }

      -- Контрастные акценты под палитру Kanagawa.
      vim.api.nvim_set_hl(0, "Visual", {
        bg = "#2A2A37",
        fg = "NONE",
        bold = true,
      })
      vim.api.nvim_set_hl(0, "VisualNOS", {
        bg = "#2A2A37",
        fg = "NONE",
        bold = true,
      })

      vim.api.nvim_set_hl(0, "Search", {
        bg = "#3B3B27",
        fg = "NONE",
        bold = true,
      })
      vim.api.nvim_set_hl(0, "IncSearch", {
        bg = "#4A2E2A",
        fg = "NONE",
        bold = true,
      })

      pcall(vim.api.nvim_set_hl, 0, "CurSearch", {
        bg = "#C4B28A",
        fg = "#1F1F28",
        bold = true,
      })

      -- Глобальная прозрачность окон/плавающих панелей.
      vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "FloatTitle", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE", fg = "#5E5A63" })
      vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "NONE", fg = "#8A7A52", bold = true })
      pcall(vim.api.nvim_set_hl, 0, "LineNrAbove", { bg = "NONE", fg = "#5E5A63" })
      pcall(vim.api.nvim_set_hl, 0, "LineNrBelow", { bg = "NONE", fg = "#5E5A63" })
      vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE", fg = "#4A4650" })
      vim.api.nvim_set_hl(0, "NonText", { bg = "NONE", fg = "#4A4650" })
      vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" })

      -- Telescope (включая file_browser) в палитре fish Kanagawa.
      vim.api.nvim_set_hl(0, "TelescopeNormal", { fg = fish.foreground, bg = "NONE" })
      vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = fish.comment, bg = "NONE" })
      vim.api.nvim_set_hl(0, "TelescopeTitle", { fg = fish.purple, bg = "NONE", bold = true })
      vim.api.nvim_set_hl(0, "TelescopePromptNormal", { fg = fish.foreground, bg = "NONE" })
      vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = fish.cyan, bg = "NONE" })
      vim.api.nvim_set_hl(0, "TelescopePromptTitle", { fg = fish.cyan, bg = "NONE", bold = true })
      vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { fg = fish.green, bg = "NONE" })
      vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { fg = fish.foreground, bg = "NONE" })
      vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = fish.comment, bg = "NONE" })
      vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { fg = fish.purple, bg = "NONE", bold = true })
      vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { fg = fish.foreground, bg = "NONE" })
      vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = fish.comment, bg = "NONE" })
      vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { fg = fish.purple, bg = "NONE", bold = true })
      vim.api.nvim_set_hl(0, "TelescopeSelection", { fg = fish.foreground, bg = fish.selection, bold = true })
      vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", { fg = fish.cyan, bg = fish.selection, bold = true })
      vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = fish.orange, bold = true })
      vim.api.nvim_set_hl(0, "TelescopeMultiSelection", { fg = fish.yellow, bg = "NONE", bold = true })
      vim.api.nvim_set_hl(0, "TelescopeMultiIcon", { fg = fish.pink, bg = "NONE" })
      vim.api.nvim_set_hl(0, "TelescopePreviewLine", { bg = fish.selection })
      vim.api.nvim_set_hl(0, "TelescopePreviewMatch", { fg = fish.orange, bold = true })
      vim.api.nvim_set_hl(0, "TelescopePromptCounter", { fg = fish.comment, bg = "NONE" })
      vim.api.nvim_set_hl(0, "TelescopePreviewDirectory", { fg = fish.cyan, bg = "NONE", bold = true })
      vim.api.nvim_set_hl(0, "TelescopeDirectoryIcon", { fg = fish.cyan, bg = "NONE" })

      -- Noice cmdline popup.
      pcall(vim.api.nvim_set_hl, 0, "NoiceCmdlinePopup", { bg = "NONE" })
      pcall(vim.api.nvim_set_hl, 0, "NoiceCmdlinePopupBorder", { bg = "NONE" })
      pcall(vim.api.nvim_set_hl, 0, "NoiceCmdlinePopupTitle", { bg = "NONE" })
      pcall(vim.api.nvim_set_hl, 0, "NoiceCmdlineIcon", { bg = "NONE" })
      pcall(vim.api.nvim_set_hl, 0, "NoicePopupmenu", { bg = "NONE" })
      pcall(vim.api.nvim_set_hl, 0, "NoicePopupmenuBorder", { bg = "NONE" })

      vim.api.nvim_set_hl(0, "CursorLine", { bg = "#252535" })
    end

    apply_highlights()

    -- Любая перезагрузка темы не должна стирать наши hl.
    local group = vim.api.nvim_create_augroup("UserKanagawaHighlights", { clear = true })
    vim.api.nvim_create_autocmd("ColorScheme", {
      group = group,
      pattern = "*",
      callback = apply_highlights,
    })
  end,
}
