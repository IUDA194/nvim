return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  config = function()
    require("lualine").setup({
      options = {
        theme = "auto",
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

    vim.cmd([[
      " Убрать фон у всех иконок файлов
      for id in split(execute('highlight'), "\n")
        if id =~# 'DevIcon'
          execute('highlight! ' . matchstr(id, 'DevIcon[^ ]*') . ' guibg=NONE ctermbg=NONE')
        endif
      endfor
    ]])

    vim.cmd([[
      highlight! lualine_b_normal guibg=NONE ctermbg=NONE
      highlight! lualine_c_normal guibg=NONE ctermbg=NONE
      highlight! lualine_x_normal guibg=NONE ctermbg=NONE
      highlight! lualine_y_normal guibg=NONE ctermbg=NONE
  

      highlight! StatusLine guibg=NONE ctermbg=NONE
      highlight! StatusLineNC guibg=NONE ctermbg=NONE
    ]])
  end,
}

