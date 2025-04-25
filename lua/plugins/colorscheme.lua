-- return {
--   { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
--   {
--     "baliestri/aura-theme",
--     lazy = false,
--     priority = 1000,
--     config = function(plugin)
--       vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
--       vim.cmd([[colorscheme aura-dark]])
--     end,
--   },
-- }

--   -- add gruvbox
--   -- { "ellisonleao/gruvbox.nvim" },
--   -- { "AlphaTechnolog/onedarker.nvim" },
--   -- { "lunarvim/Onedarker.nvim" },
--   -- { "cocopon/iceberg.vim" },
--   -- { "EdenEast/nightfox.nvim" }, -- lazy
--   { "catppuccin/nvim", name = "catppuccin" },
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "catppuccin",
--     },
--   },
-- }
return {
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.gruvbox_material_enable_italic = true
      vim.cmd.colorscheme("gruvbox-material")
    end,
  },
}
-- {
--   "catppuccin/nvim",
--   name = "catppuccin",
--   config = function()
--     require("catppuccin").setup({
--       flavour = "frappe", -- Set flavor here
--     })
--   end,
-- },
-- {
--   "LazyVim/LazyVim",
--   opts = {
--     colorscheme = "catppuccin",
--   },
-- },
-- }
