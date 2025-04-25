-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- NOTE, leader = <Space>
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Netrw
keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- remove the default Snacks/Line-move mappings
-- vim.keymap.del("i", "<M-j>")
-- vim.keymap.del("i", "<M-k>")
-- vim.keymap.del({ "n", "v" }, "<M-j>")
-- vim.keymap.del({ "n", "v" }, "<M-k>")

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

keymap.set(
    "n",
    "<C-s>",
    [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "Simple find and replace in current file" }
)

keymap.set("n", "<M-z>", ":set wrap!<CR>", { desc = "Toggle line wrap" })

keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete to black hole register to not replace last yank" })

-- keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "go to next location‐list item, then center screen" })
-- keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "go to prev location‐list item, then center screen" })

-- Toggle transparency
local current = false
keymap.set("n", "<leader>tb", function()
    current = not current
    require("gruvbox").setup({ transparent_mode = current })
    vim.cmd("colorscheme gruvbox")
end, { desc = "Toggle Gruvbox transparency" })

keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })
keymap.set("n", "ss", ":split<CR>", { desc = "Split current window horizontally" })

-- In terminal mode, pressing <C-x> will exit terminal mode
keymap.set("t", "<C-x>", [[<C-\><C-n>]], { noremap = true, silent = true })

-- Pressing ! will begin a command
keymap.set("n", "!", ":!")

---------------------------------------------------------
-- ALLOWING SMART SPLITS MOVEMENTS IN TERMINAL MODE
---------------------------------------------------------
-- Insert-mode in terminal: drop back to normal + move
vim.keymap.set("t", "<C-h>", function()
    -- 1) Temporarily exit terminal insert mode
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true), "n", true)
    -- 2) Use smart-splits to move left
    require("smart-splits").move_cursor_left()
end, { noremap = true, silent = true })

vim.keymap.set("t", "<C-j>", function()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true), "n", true)
    require("smart-splits").move_cursor_down()
end, { noremap = true, silent = true })

vim.keymap.set("t", "<C-k>", function()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true), "n", true)
    require("smart-splits").move_cursor_up()
end, { noremap = true, silent = true })

vim.keymap.set("t", "<C-l>", function()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true), "n", true)
    require("smart-splits").move_cursor_right()
end, { noremap = true, silent = true })

-- Normal-mode in terminal buffers: directly invoke smart-splits
vim.api.nvim_create_autocmd("TermOpen", {
    callback = function()
        local b = vim.api.nvim_get_current_buf()
        keymap.set( "n", "<C-h>", require("smart-splits").move_cursor_left, { buffer = b, noremap = true, silent = true })
        keymap.set( "n", "<C-j>", require("smart-splits").move_cursor_down, { buffer = b, noremap = true, silent = true })
        keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up, { buffer = b, noremap = true, silent = true })
        keymap.set( "n", "<C-l>", require("smart-splits").move_cursor_right, { buffer = b, noremap = true, silent = true })
    end,
})

---------------------------------------------------------

-- disable linting in the current buffer
-- vim.keymap.set("n", "<leader>un", function()
--   vim.api.nvim_clear_autocmds({ group = "nvim-lint", buffer = 0 })
--   vim.notify("🔇 Linting disabled for this buffer", vim.log.levels.WARN)
-- end, { desc = "Disable linting in this buffer" })

-- Toggle nvim-lint globally (all buffers)
vim.keymap.set("n", "<leader>uN", function()
    -- clear all lint autocmds
    vim.api.nvim_clear_autocmds({ group = "nvim-lint" })
    -- clear diagnostics in all open buffers
    for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
        vim.diagnostic.reset(nil, bufnr)
    end
    vim.notify("🔇 Linting disabled globally. Re-enable by restarting nvim", vim.log.levels.WARN)
end, { desc = "Disable linting everywhere" })

-- AVAILABLE MAPPINGS (that I have come across)
keymap.set("n", "<leader>e", "")
keymap.set("n", "<leader>E", "")
keymap.set("n", "<leader>sM", "")
keymap.set("n", "<C-i>", "")
keymap.set("n", "<C-I>", "")
keymap.set("n", "U", "")
keymap.set("n", "U", "")
keymap.set("n", "Q", "")
keymap.set("n", "<c-k>", "")
keymap.set("n", "<leader>fb", "")
keymap.set("n", "<leader>fB", "")
keymap.set("n", "<leader>ff", "")
keymap.set("n", "<leader>fF", "")
