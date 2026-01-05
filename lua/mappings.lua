require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<C-d>", "<C-d>", { desc = "Scroll down" })
map("n", "<C-u>", "<C-u>", { desc = "Scroll up" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("n", "<leader>z", "<cmd>TZFocus<cr>", { desc = "Toggle Zen Mode" })
