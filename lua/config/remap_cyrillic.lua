local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Таблица: русская клавиша → английская
local cyrillic_to_latin = {
  ["й"] = "q", ["ц"] = "w", ["у"] = "e", ["к"] = "r", ["е"] = "t",
  ["н"] = "y", ["г"] = "u", ["ш"] = "i", ["щ"] = "o", ["з"] = "p",
  ["ф"] = "a", ["ы"] = "s", ["в"] = "d", ["а"] = "f", ["п"] = "g",
  ["р"] = "h", ["о"] = "j", ["л"] = "k", ["д"] = "l",
  ["я"] = "z", ["ч"] = "x", ["с"] = "c", ["м"] = "v", ["и"] = "b",
  ["т"] = "n", ["ь"] = "m",
}

for cyr, lat in pairs(cyrillic_to_latin) do
  map("n", cyr, lat, opts)
  map("v", cyr, lat, opts)
end

