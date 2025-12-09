<p align="center">
  <img src="./assets/neovim-anime.png" alt="Neovim Anime Neovim Icon" width="220" />
</p>

<h1 align="center">Neovim config</h1>

<p align="center">
  Ежедневная конфигурация Neovim с прозрачной темой, быстрым поиском,
  продвинутым LSP-стеком и удобными хоткеями.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Neovim-0.10+-57A143?logo=neovim&logoColor=white" />
  <img src="https://img.shields.io/badge/OS-macOS%20%7C%20Linux-lightgrey" />
  <img src="https://img.shields.io/badge/Leader-%3CSpace%3E-blue" />
</p>

---

> Ежедневная конфигурация Neovim с прозрачной темой, быстрым поиском, продвинутым LSP-стеком и удобными хоткеями. Лидер – `<Space>`, локальный лидер – `\`.

## Возможности

- Прозрачный интерфейс и тёмная тема Tokyodark, настроенные хайлайты для статуса, телескопа и значков.
- Полная интеграция с системным буфером обмена (`y/d/p`) и зеркальные хоткеи для русской раскладки.
- Единый LSP-стек на базе `nvim-lspconfig`+`mason`, включающий Pyright, Ty, Ruff, Rust Analyzer, Clangd, Deno, TypeScript, HTML/CSS и тонкую настройку диагностики.
- Автоформатирование по `<leader>F` через `conform.nvim` (Prettier, Ruff, rustfmt, clang-format и пр.).
- Treesitter-подсветка, cmp-автодополнение с LuaSnip и иконками, а также фановые визуальные эффекты (`smear-cursor`, выделение активной строки).
- Удобный UX: статус-бар на `lualine`, всплывающие уведомления в `noice.nvim`, Telescope c файловым менеджером и LazyGit внутри Neovim.
- Markdown-воркфлоу с живым рендером, переходами по ссылкам, чекбоксами и списком задач из тега TODO.

## Плагины

| Плагин | Описание |
| --- | --- |
| [folke/lazy.nvim](https://github.com/folke/lazy.nvim) | Пакетный менеджер, который тянет конфиг из `lua/plugins` и держит плагины в актуальном состоянии. |
| [tiagovla/tokyodark.nvim](https://github.com/tiagovla/tokyodark.nvim) | Темная цветовая схема с прозрачным фоном и мягкой гаммой. |
| [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | AST-подсветка и авто-отступы для всех поддерживаемых языков. |
| [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) + [mason.nvim](https://github.com/mason-org/mason.nvim) | Настроенный LSP-стек для Python, JS/TS, Rust, C/C++, HTML/CSS и Deno, включая Ty и Ruff. |
| [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp) + [LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Всплывающие панели автодополнения с иконками из `lspkind` и поддержкой сниппетов/буфера/файловой системы. |
| [stevearc/conform.nvim](https://github.com/stevearc/conform.nvim) | Унифицированный форматтер (Prettier, Ruff, rustfmt, clang-format и т.д.) на `<leader>F`. |
| [folke/noice.nvim](https://github.com/folke/noice.nvim) + [rcarriga/nvim-notify](https://github.com/rcarriga/nvim-notify) | Красивые уведомления и мини-худ о состоянии команд/ сообщений. |
| [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Минималистичный статус-бар без иконок, с глобальным статусом и прозрачным фоном. |
| [sphamba/smear-cursor.nvim](https://github.com/sphamba/smear-cursor.nvim) | Эффект «шлейфа» курсора при перемещении и прокрутке. |
| [ya2s/nvim-cursorline](https://github.com/ya2s/nvim-cursorline) | Подсветка текущей строки и слов под курсором. |
| [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Главный файловый/символьный поиск (`<leader>ff`) с расширениями. |
| [nvim-telescope/telescope-file-browser.nvim](https://github.com/nvim-telescope/telescope-file-browser.nvim) | Ivy-файловый браузер (`<space>fb`) в директории текущего файла. |
| [kdheepak/lazygit.nvim](https://github.com/kdheepak/lazygit.nvim) | Встроенный вызов LazyGit по `<leader>lg`. |
| [folke/todo-comments.nvim](https://github.com/folke/todo-comments.nvim) | Подсветка и поиск пометок TODO/FIX/HACK (`<leader>td` вызывает Telescope). |
| [thenbe/markdown-todo.nvim](https://github.com/thenbe/markdown-todo.nvim) | Читабельные чекбоксы и список задач в Markdown-файлах. |
| [MeanderingProgrammer/render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim) | Живой рендер Markdown прямо в буфере. |
| [jghauser/follow-md-links.nvim](https://github.com/jghauser/follow-md-links.nvim) | Переходы по Markdown-ссылкам (`<CR>` / `<BS>`). |

## Горячие клавиши

### Глобальные переназначения

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

### Markdown режим

| Режим | Клавиша | Действие | Где задано |
| --- | --- | --- | --- |
| normal (только Markdown буферы) | `<CR>` | Перейти по ссылке (`follow-md-links`) | `lua/plugins/md-render.lua` |
| normal (только Markdown буферы) | `<BS>` | Вернуться к предыдущему буферу (`:edit #`) | `lua/plugins/md-render.lua` |

## Поддержка кириллицы

В normal/visual режимах любой из указанных русских символов срабатывает как соответствующая латиница, что упрощает работу в Neovim, когда раскладка переключена. Определено в `lua/config/remap_cyrillic.lua`.

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
