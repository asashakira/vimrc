-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap.set

local opts = { noremap = true, silent = true }

-- open netrw
-- keymap("n", "<leader>e", vim.cmd.Ex)

-- keep cursor centered
-- keymap("n", "J", "mzJ`z")
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

-- lsp keymaps
keymap("n", "gl", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
