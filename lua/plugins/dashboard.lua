return {
    "snacks.nvim",
    opts = {
        dashboard = {
            preset = {
                pick = function(cmd, opts)
                    return LazyVim.pick(cmd, opts)()
                end,
                -- Font Style = ANSI Shadow
                header = [[
██╗   ██╗ ██████╗ ██╗   ██╗    ███╗   ██╗███████╗██████╗ ██████╗ 
╚██╗ ██╔╝██╔═══██╗██║   ██║    ████╗  ██║██╔════╝██╔══██╗██╔══██╗
 ╚████╔╝ ██║   ██║██║   ██║    ██╔██╗ ██║█████╗  ██████╔╝██║  ██║
  ╚██╔╝  ██║   ██║██║   ██║    ██║╚██╗██║██╔══╝  ██╔══██╗██║  ██║
   ██║   ╚██████╔╝╚██████╔╝    ██║ ╚████║███████╗██║  ██║██████╔╝
   ╚═╝    ╚═════╝  ╚═════╝     ╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝╚═════╝ 
 ]],
                -- stylua: ignore
                ---@type snacks.dashboard.Item[]
                keys = {
                    { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                    { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                    { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
                    { icon = " ", key = "e", desc = "Open File Tree", action = function() Snacks.explorer({ cwd = LazyVim.root() }) end },
                    { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
                    { icon = "󰪺 ", key  = "p", desc = "Recent Projects", action = function() LazyVim.pick("projects")() end, },
                    { icon = " ", key  = "o", desc = "Open GitHub", action = function()
                        local url = "https://github.com/Ernesto-B?tab=repositories"
                        if vim.loop.os_uname().sysname:match("Windows") then
                            -- on Windows use the builtin 'start' from cmd.exe:
                            vim.fn.jobstart({ "cmd.exe", "/C", "start", "", url }, { detach = true })
                        else
                            -- on *nix use the default opener
                            vim.fn.jobstart({ "xdg-open", url }, { detach = true })
                        end
                    end,
                    },
                    { icon = " ", key = "s", desc = "Restore Session", section = "session" },
                    { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
                    { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
                    { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
                    { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                },
            },
        },
    },
}
