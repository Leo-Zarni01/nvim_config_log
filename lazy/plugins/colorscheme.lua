return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  -- { "AlphaTechnolog/onedarker.nvim" },
  { "lunarvim/Onedarker.nvim" },
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedarker",
      style = "night",
    },
  },
}
