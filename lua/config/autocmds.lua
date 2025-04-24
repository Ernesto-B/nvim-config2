-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

--- Prune any stale ShaDa temp files (main.shada.tmp.*), preserving main.shada itself.
local function prune_shada_tmp()
    local shada_dir = vim.fn.stdpath("data") .. "/shada"
    for _, tmp in ipairs(vim.fn.globpath(shada_dir, "main.shada.tmp.*", false, true)) do
        -- pcall to avoid errors if file was removed concurrently
        pcall(os.remove, tmp)
    end
end

-- Run on startup
prune_shada_tmp()

-- Run again just before quitting, in case new tmps were left behind
vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = prune_shada_tmp,
})
