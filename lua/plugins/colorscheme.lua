return {
  "sainnhe/gruvbox-material",
  lazy = false,
  priority = 1000,
  init = function()
    vim.g.gruvbox_material_background = "hard"
    vim.g.gruvbox_material_foreground = "original"
    vim.g.gruvbox_material_transparent_background = 2
    vim.g.gruvbox_material_float_style = "blend"
  end,
  config = function()
    vim.opt.termguicolors = true
    vim.cmd.colorscheme("gruvbox-material")

    local function apply_highlights()
      local config = vim.fn["gruvbox_material#get_configuration"]()
      local palette = vim.fn["gruvbox_material#get_palette"](config.background, config.foreground, config.colors_override)
      local function hex(name)
        local value = palette[name]
        if type(value) == "table" then
          return value[1]
        end
        return value
      end

      -- Контрастные акценты под палитру Gruvbox Material.
      vim.api.nvim_set_hl(0, "Visual", {
        bg = hex("bg_visual_yellow"),
        fg = "NONE",
        bold = true,
      })
      vim.api.nvim_set_hl(0, "VisualNOS", {
        bg = hex("bg_visual_yellow"),
        fg = "NONE",
        bold = true,
      })

      vim.api.nvim_set_hl(0, "Search", {
        bg = hex("bg_visual_yellow"),
        fg = "NONE",
        bold = true,
      })
      vim.api.nvim_set_hl(0, "IncSearch", {
        bg = hex("bg_visual_red"),
        fg = "NONE",
        bold = true,
      })

      pcall(vim.api.nvim_set_hl, 0, "CurSearch", {
        bg = hex("yellow"),
        fg = hex("bg0"),
        bold = true,
      })

      -- Глобальная прозрачность окон/плавающих панелей.
      vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "FloatTitle", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE", fg = hex("bg4") })
      vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "NONE", fg = hex("yellow"), bold = true })
      pcall(vim.api.nvim_set_hl, 0, "LineNrAbove", { bg = "NONE", fg = hex("bg4") })
      pcall(vim.api.nvim_set_hl, 0, "LineNrBelow", { bg = "NONE", fg = hex("bg4") })
      vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE", fg = hex("bg4") })
      vim.api.nvim_set_hl(0, "NonText", { bg = "NONE", fg = hex("bg4") })
      vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" })

      -- Telescope (включая file_browser) в палитре Gruvbox Material.
      vim.api.nvim_set_hl(0, "TelescopeNormal", { fg = hex("fg1"), bg = "NONE" })
      vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = hex("orange"), bg = "NONE" })
      vim.api.nvim_set_hl(0, "TelescopeTitle", { fg = hex("purple"), bg = "NONE", bold = true })
      vim.api.nvim_set_hl(0, "TelescopePromptNormal", { fg = hex("fg1"), bg = "NONE" })
      vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = hex("orange"), bg = "NONE" })
      vim.api.nvim_set_hl(0, "TelescopePromptTitle", { fg = hex("orange"), bg = "NONE", bold = true })
      vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { fg = hex("orange"), bg = "NONE" })
      vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { fg = hex("fg1"), bg = "NONE" })
      vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = hex("orange"), bg = "NONE" })
      vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { fg = hex("orange"), bg = "NONE", bold = true })
      vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { fg = hex("fg1"), bg = "NONE" })
      vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = hex("orange"), bg = "NONE" })
      vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { fg = hex("orange"), bg = "NONE", bold = true })
      vim.api.nvim_set_hl(0, "TelescopeSelection", { fg = hex("fg1"), bg = hex("bg_visual_yellow"), bold = true })
      vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", { fg = hex("orange"), bg = hex("bg_visual_yellow"), bold = true })
      vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = hex("orange"), bold = true })
      vim.api.nvim_set_hl(0, "TelescopeMultiSelection", { fg = hex("yellow"), bg = "NONE", bold = true })
      vim.api.nvim_set_hl(0, "TelescopeMultiIcon", { fg = hex("orange"), bg = "NONE" })
      vim.api.nvim_set_hl(0, "TelescopePreviewLine", { bg = hex("bg_visual_yellow") })
      vim.api.nvim_set_hl(0, "TelescopePreviewMatch", { fg = hex("orange"), bold = true })
      vim.api.nvim_set_hl(0, "TelescopePromptCounter", { fg = hex("bg4"), bg = "NONE" })
      vim.api.nvim_set_hl(0, "TelescopePreviewDirectory", { fg = hex("orange"), bg = "NONE", bold = true })
      vim.api.nvim_set_hl(0, "TelescopeDirectoryIcon", { fg = hex("orange"), bg = "NONE" })

      -- Noice cmdline popup.
      pcall(vim.api.nvim_set_hl, 0, "NoiceCmdlinePopup", { bg = "NONE" })
      pcall(vim.api.nvim_set_hl, 0, "NoiceCmdlinePopupBorder", { fg = hex("orange"), bg = "NONE" })
      pcall(vim.api.nvim_set_hl, 0, "NoiceCmdlinePopupTitle", { fg = hex("orange"), bg = "NONE", bold = true })
      pcall(vim.api.nvim_set_hl, 0, "NoiceCmdlineIcon", { bg = "NONE" })
      pcall(vim.api.nvim_set_hl, 0, "NoicePopupmenu", { bg = "NONE" })
      pcall(vim.api.nvim_set_hl, 0, "NoicePopupmenuBorder", { bg = "NONE" })

      vim.api.nvim_set_hl(0, "CursorLine", { bg = hex("bg1") })
    end

    apply_highlights()

    -- Любая перезагрузка темы не должна стирать наши hl.
    local group = vim.api.nvim_create_augroup("UserGruvboxMaterialHighlights", { clear = true })
    vim.api.nvim_create_autocmd("ColorScheme", {
      group = group,
      pattern = "gruvbox-material",
      callback = apply_highlights,
    })
  end,
}
