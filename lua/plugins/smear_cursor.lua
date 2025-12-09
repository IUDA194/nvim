return {
  "sphamba/smear-cursor.nvim",
  opts = {
    -- анимация при переходах между буферами/окнами
    smear_between_buffers = true,
    -- анимация при перемещении курсора по строкам
    smear_between_neighbor_lines = true,
    -- делать «trail» (размазывание) в области буфера, не экрана — полезно при скролле
    scroll_buffer_space = true,
    -- включать эффект и в режиме Insert
    smear_insert_mode = true,
    -- (опционально) если шрифт поддерживает «legacy computing symbols» — визуал эффекты будут чище
    legacy_computing_symbols_support = false,
    -- можно настроить цвет курсора (или "none" чтобы подбирать текстовый цвет автоматически)
    cursor_color = "none",
  },
  config = function(_, opts)
    require("smear_cursor").setup(opts)
  end,
}

