return {
    "akinsho/toggleterm.nvim",
    version = "*",
    lazy = false,
    config = function()
        local Terminal = require("toggleterm.terminal").Terminal
        local map = vim.keymap.set
        local o = { noremap = true, silent = true }

        -- Term #1: horizontal split
        local th = Terminal:new({
            count = 1,
            direction = "horizontal",
            size = 15,
            open_mapping = false, -- we do our own mapping
        })
        -- Term #2: vertical split
        local tv1 = Terminal:new({
            count = 2,
            direction = "vertical",
            size = 60,
            open_mapping = false,
        })
        -- Term #3: another vertical split
        local tv2 = Terminal:new({
            count = 3,
            direction = "vertical",
            size = 60,
            open_mapping = false,
        })

        -- Now bind Ctrl-\ to horizontal term #1
        map({ "n", "t" }, "<C-\\>", function()
            th:toggle()
        end, o)
        -- Ctrl-] → vertical term #2
        map({ "n", "t" }, "<C-]>", function()
            tv1:toggle()
        end, o)
        -- Ctrl-} → vertical term #3
        map({ "n", "t" }, "<C-}>", function()
            tv2:toggle()
        end, o)
    end,
}
