-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- NOTE, leader = <Space>
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Netrw
keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Moving selected lines up and down
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("n", "J", "mzJ`z", { desc = "Cursor stays in place when merging lines" })
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down while keeping cursor in place" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up while keeping cursor in place" })
keymap.set("n", "n", "nzzzv", { desc = "Jump to next search result centered and opening folds" })
keymap.set("n", "N", "Nzzzv", { desc = "Jump to next search result centered and opening folds" })
keymap.set("n", "=ap", "ma=ap'a", { desc = "Auto indent paragraph" })

keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy selected text to + buffer (clipboard)" })

keymap.set("i", "<C-c>", "<Esc>", { desc = "Escape everything with <C-c>" })

-- Perhaps remove this since it can be done using a plugin that I have installed
keymap.set(
  "n",
  "<leader>s",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Search and replace current word" }
)

keymap.set("n", "<M-z>", ":set wrap!<CR>", { desc = "Toggle line wrap" })

keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete to black hole register to not replace last yank" })

-- keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "go to next location‐list item, then center screen" })
-- keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "go to prev location‐list item, then center screen" })

-- Toggle transparency
local current = false
vim.keymap.set("n", "<leader>tb", function()
  current = not current
  require("gruvbox").setup({ transparent_mode = current })
  vim.cmd("colorscheme gruvbox")
end, { desc = "Toggle Gruvbox transparency" })

keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })
keymap.set("n", "ss", ":split<CR>", { desc = "Create terminal below" })
