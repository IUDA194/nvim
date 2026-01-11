vim.g.mapleader = " "           -- <Space> как <leader>
vim.g.maplocalleader = "\\"

-- Для прозрачного фона
vim.cmd([[
  highlight Normal       guibg=NONE ctermbg=NONE
  highlight NormalNC     guibg=NONE ctermbg=NONE
  highlight EndOfBuffer  guibg=NONE ctermbg=NONE
  highlight FloatBorder  guibg=NONE ctermbg=NONE
  highlight VertSplit    guibg=NONE ctermbg=NONE
  highlight SignColumn   guibg=NONE ctermbg=NONE
  highlight StatusLine   guibg=NONE ctermbg=NONE
  highlight TelescopeNormal guibg=NONE ctermbg=NONE
  " Более мягкое (полу‑прозрачное) выделение Visual
]])

-- Для поддержки кириличных раскладок
require("config.remap_cyrillic")

-- Для копирования в системный буфер
vim.keymap.set({ "n", "v" }, "y", '"+y')     -- yank
vim.keymap.set("n", "Y", '"+Y')              -- yank entire line
vim.keymap.set({ "n", "v" }, "d", '"+d')     -- delete (cut)
vim.keymap.set({ "n", "v" }, "x", '"+x')     -- cut (char)
vim.keymap.set({ "n", "v" }, "p", '"+p')     -- paste
vim.keymap.set({ "n", "v" }, "P", '"+P')     -- paste before

require("config.lazy")

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 4


