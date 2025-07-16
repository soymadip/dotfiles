-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local kmap = vim.keymap.set

-- Normal mode with jj
kmap("i", "jj", "<Esc>", { desc = "Exit insert mode with jj" })
kmap("t", "jj", [[<C-\><C-n>]], { desc = "Exit terminal mode with jj", noremap = true })
