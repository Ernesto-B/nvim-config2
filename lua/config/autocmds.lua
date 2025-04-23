-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

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
