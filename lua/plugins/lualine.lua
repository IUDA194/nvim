return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  config = function()
    local config = vim.fn["gruvbox_material#get_configuration"]()
    local palette = vim.fn["gruvbox_material#get_palette"](config.background, config.foreground, config.colors_override)
    local function hex(name)
      local value = palette[name]
      if type(value) == "table" then
        return value[1]
      end
      return value
    end

    local transparent_theme = {
      normal = {
        a = { fg = hex("orange"), bg = "NONE", gui = "bold" },
        b = { fg = hex("fg0"), bg = "NONE" },
        c = { fg = hex("bg4"), bg = "NONE" },
      },
      insert = {
        a = { fg = hex("orange"), bg = "NONE", gui = "bold" },
        b = { fg = hex("fg0"), bg = "NONE" },
        c = { fg = hex("bg4"), bg = "NONE" },
      },
      visual = {
        a = { fg = hex("orange"), bg = "NONE", gui = "bold" },
        b = { fg = hex("fg0"), bg = "NONE" },
        c = { fg = hex("bg4"), bg = "NONE" },
      },
      replace = {
        a = { fg = hex("orange"), bg = "NONE", gui = "bold" },
        b = { fg = hex("fg0"), bg = "NONE" },
        c = { fg = hex("bg4"), bg = "NONE" },
      },
      command = {
        a = { fg = hex("orange"), bg = "NONE", gui = "bold" },
        b = { fg = hex("fg0"), bg = "NONE" },
        c = { fg = hex("bg4"), bg = "NONE" },
      },
      inactive = {
        a = { fg = hex("bg4"), bg = "NONE" },
        b = { fg = hex("bg4"), bg = "NONE" },
        c = { fg = hex("bg4"), bg = "NONE" },
      },
    }

    local function clear_lualine_backgrounds()
      for _, hl in ipairs(vim.fn.getcompletion("lualine_", "highlight")) do
        vim.api.nvim_set_hl(0, hl, { bg = "NONE" })
      end
      vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" })
    end

    require("lualine").setup({
      options = {
        theme = transparent_theme,
        icons_enabled = false,
        component_separators = { left = "│", right = "│" }, -- можно оставить │ или "" если не нужно
        section_separators = { left = "", right = "" },    -- ❌ убираем треугольники
        globalstatus = true,
      },
      sections = {
        lualine_a = {
          {
            "mode",
            separator = { left = " ", right = " " }, -- отступы
            padding = { left = 1, right = 1 },       -- пространство слева/справа от текста
          },
        },
        lualine_b = { "branch" },
        lualine_c = { "filename" },
        lualine_x = { "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    })

    clear_lualine_backgrounds()
    vim.api.nvim_create_autocmd("ColorScheme", {
      group = vim.api.nvim_create_augroup("UserTransparentLualine", { clear = true }),
      callback = clear_lualine_backgrounds,
    })

    vim.cmd([[
      " Убрать фон у всех иконок файлов
      for id in split(execute('highlight'), "\n")
        if id =~# 'DevIcon'
          execute('highlight! ' . matchstr(id, 'DevIcon[^ ]*') . ' guibg=NONE ctermbg=NONE')
        endif
      endfor
    ]])

  end,
}
