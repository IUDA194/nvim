vim.keymap.set("n", "<leader>t", [[<Cmd>ToggleTerm direction=float<CR>]], {noremap = true, silent = true})
vim.keymap.set("t", "<leader>t", [[<C-\><C-n><Cmd>ToggleTerm<CR>]], {noremap = true, silent = true})

return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        require("toggleterm").setup({
            direction = "float",
            open_mapping = [[<leader>t]],
            start_in_insert = true,
            shade_terminals = false, 
            float_opts = {
                border = "curved",
                -- Поставь 0, если хочешь полную прозрачность без дымки
                winblend = 0, 
            },
            highlights = {
                -- Убираем фон самого окна терминала
                NormalFloat = {
                    guibg = "none",
                },
                -- Убираем фон рамки
                FloatBorder = {
                    guibg = "none",
                    -- Можешь задать яркий цвет рамке, чтобы она не терялась
                    guifg = "#8D96C6", 
                },
            },
        })
    end
}
