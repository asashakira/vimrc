vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap.set

-- open netrw
keymap("n", "<leader>e", vim.cmd.Ex)

-- window navigation
keymap("n", "<leader>h", ":wincmd h<cr>")
keymap("n", "<leader>j", ":wincmd j<cr>")
keymap("n", "<leader>k", ":wincmd k<cr>")
keymap("n", "<leader>l", ":wincmd l<cr>")

-- keep cursor centered
-- keymap("n", "J", "mzJ`z")
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")


-- telescope keymaps
local builtin = require("telescope.builtin")
local is_inside_work_tree = {}

local project_files = function()
  local opts = {} -- define here if you want to define something

  local cwd = vim.fn.getcwd()
  if is_inside_work_tree[cwd] == nil then
    vim.fn.system("git rev-parse --is-inside-work-tree")
    is_inside_work_tree[cwd] = vim.v.shell_error == 0
  end

  if is_inside_work_tree[cwd] then
    builtin.git_files(opts)
  else
    builtin.find_files(opts)
  end
end

keymap("n", "<C-p>", project_files, { desc = "Fuzzy find files in cwd" })
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
keymap("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Fuzzy find buffered files" })
keymap("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })


-- harpoon keymaps
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

keymap("n", "<leader>a", mark.add_file)
keymap("n", "<C-e>", ui.toggle_quick_menu)

keymap("n", "<C-j>", function() ui.nav_file(1) end)
keymap("n", "<C-k>", function() ui.nav_file(2) end)
keymap("n", "<C-l>", function() ui.nav_file(3) end)
