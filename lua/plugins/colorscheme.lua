local selected = "gruvbox-material"

return {
  require("plugins.colorschemes.aura-theme"),
  require("plugins.colorschemes.gruvbox-material"),
  require("plugins.colorschemes.vercel"),
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = selected
    }
  }
}
