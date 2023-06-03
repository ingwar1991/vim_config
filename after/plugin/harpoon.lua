local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<C-h>a", mark.add_file)
vim.keymap.set("n", "<C-h>h", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-h>n", function() ui.nav_next() end)
vim.keymap.set("n", "<C-h>p", function() ui.nav_prev() end)

vim.keymap.set("n", "<C-h>j", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-h>k", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-h>l", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-h>;", function() ui.nav_file(4) end)
