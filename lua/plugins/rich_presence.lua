-- return {
--   {
--     "andweeb/presence.nvim",
--     opts = {
--       main_image = "file",
--     },
--   },
-- }

-- not working yet
return {
  "vyfor/cord.nvim",
  build = ":Cord update",
  opts = {
    display = {
      theme = "catppuccin",
      flavor = "accent",
    },
  },
}
