-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--

---------------------------------------------------------
-- Setting the shell to bash
---------------------------------------------------------
vim.opt.shell = "C:\\PROGRA~1\\Git\\bin\\bash.exe"
vim.opt.shellcmdflag = "-c" -- Ensures commands are executed correctly
vim.opt.shellquote = ""
vim.opt.shellxquote = ""

---------------------------------------------------------
-- File Names - NOT SURE IF WORKING
---------------------------------------------------------
vim.opt.isfname:append("@-@") -- Treat @-@ as part of filenames in search
vim.opt.isfname:append(".") -- Treat . as part of filenames in search?? Not sure if working

---------------------------------------------------------
-- Performance
---------------------------------------------------------
vim.opt.updatetime = 50 -- Faster updates (good for CursorHold, etc.)

---------------------------------------------------------
-- colors
---------------------------------------------------------
vim.opt.colorcolumn = "80" -- Vertical line at col=80
vim.opt.termguicolors = false -- True color support

---------------------------------------------------------
-- Search
---------------------------------------------------------
vim.opt.hlsearch = true -- Dont highlight all search matches
vim.opt.incsearch = true -- Show matches as you type

---------------------------------------------------------
-- Indentation
---------------------------------------------------------
vim.opt.tabstop = 4 -- Visual width of tabs
vim.opt.softtabstop = 4 -- Auto-indent uses 4 spaces
vim.opt.shiftwidth = 4 -- <<, >> shift by 4 spaces
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.smartindent = true -- Smart indentation on new lines

---------------------------------------------------------
-- Line Numbers
---------------------------------------------------------
vim.opt.nu = true -- Enable line numbers
vim.opt.relativenumber = true -- Relative line numbers for quick jump
