-- return {
--   "andweeb/presence.nvim",
--   {
--     opts = {
--       main_image = "file",
--     },
--   },
-- }

-- not working yet
-- return {
--   "vyfor/cord.nvim",
--   build = ":Cord update",
--   opts = {
--     display = {
--       theme = "catppuccin",
--       flavor = "accent",
--     },
--   },
-- }
return {
  {
    "vyfor/cord.nvim",
    build = ":Cord update",
    opts = {
      -- log_level = vim.log.levels.TRACE,
      display = {
        theme = "catppuccin",
        flavor = "dark",
      },
    },
  },
}
