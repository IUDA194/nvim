# Neovim config hotkeys

Все горячие клавиши, определённые в текущем конфиге. Лидер – `<Space>`, локальный лидер – `\`.

## Глобальные переназначения

| Режим | Клавиша | Действие | Где задано |
| --- | --- | --- | --- |
| normal/visual | `y` | Копировать выделение в системный буфер | `init.lua` |
| normal | `Y` | Копировать строку в системный буфер | `init.lua` |
| normal/visual | `d` | Вырезать (исп. системный буфер) | `init.lua` |
| normal/visual | `x` | Вырезать символ (системный буфер) | `init.lua` |
| normal/visual | `p` | Вставить после курсора из системного буфера | `init.lua` |
| normal/visual | `P` | Вставить перед курсором из системного буфера | `init.lua` |
| normal/visual | `<leader>F` | Форматирование файла/выделения через conform.nvim | `lua/plugins/conform.lua` |
| normal | `<leader>ff` | `Telescope find_files` | `lua/plugins/telescope.lua` |
| normal | `<space>fb` | Телескоп-файлобраузер в каталоге текущего файла | `lua/plugins/telescope-browser.lua` |
| normal | `<leader>lg` | Открыть LazyGit | `lua/plugins/lazygit.lua` |
| normal | `<leader>td` | Поиск TODO через TodoTelescope | `lua/plugins/todo.lua` |

## Markdown режим

| Режим | Клавиша | Действие | Где задано |
| --- | --- | --- | --- |
| normal (только Markdown буферы) | `<CR>` | Перейти по ссылке (`follow-md-links`) | `lua/plugins/md-render.lua` |
| normal (только Markdown буферы) | `<BS>` | Вернуться к предыдущему буферу (`:edit #`) | `lua/plugins/md-render.lua` |

## Поддержка кириллицы

В normal/visual режимах любой из указанных русских символов срабатывает как соответствующая латиница, что упрощает работу в Vim, когда раскладка переключена. Определено в `lua/config/remap_cyrillic.lua`.

| Рус | Lat | Рус | Lat | Рус | Lat |
| --- | --- | --- | --- | --- | --- |
| й | q | ц | w | у | e |
| к | r | е | t | н | y |
| г | u | ш | i | щ | o |
| з | p | ф | a | ы | s |
| в | d | а | f | п | g |
| р | h | о | j | л | k |
| д | l | я | z | ч | x |
| с | c | м | v | и | b |
| т | n | ь | m |  |  |

