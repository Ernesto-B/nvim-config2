-- Example of how to change themes:
-- return {
--   -- add gruvbox
--   { "ellisonleao/gruvbox.nvim" },
--
--   -- Configure LazyVim to load gruvbox
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "gruvbox",
--     },
--   },
-- }

return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000, -- load early
    opts = {
      transparent_mode = true,
      dim_inactive = false,
    },
    config = function(_, opts)
      require("gruvbox").setup(opts)
      vim.cmd("colorscheme gruvbox")
    end,
  },
}
