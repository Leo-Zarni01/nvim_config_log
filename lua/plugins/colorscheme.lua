local selected = "gruvbox-material"

return {
  require("plugins.colorschemes.aura-theme"),
  require("plugins.colorschemes.gruvbox-material"),
  require("plugins.colorschemes.vercel"),
  require("plugins.colorschemes.vesper"),
  {
    "LazyVim/LazyVim",
    opts = {
            colorscheme = selected
    }
  }
}
