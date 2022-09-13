vim.g.mapleader = " "
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', { noremap = true })
vim.o.relativenumber = true

require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	-- colorscheme
	use 'folke/tokyonight.nvim'

	-- autopair
	use {"windwp/nvim-autopairs", config = function() 
		require("nvim-autopairs").setup {} end}

	-- treesitter plugin 
	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

	-- nvim-tree plugin
	use {'kyazdani42/nvim-tree.lua', requires = {'kyazdani42/nvim-web-devicons'},
  		tag = 'nightly'}

	-- mark-down preview nvim
	-- install without yarn or npm
	use({"iamcco/markdown-preview.nvim",run = function() vim.fn["mkdp#util#install"]() end,})

	use 'ferrine/md-img-paste.vim'

	-- plenary 
	use 'nvim-lua/plenary.nvim'

	-- Telescope
	use {'nvim-telescope/telescope.nvim'}	

	-- start of vim-cmp 
	use 'neovim/nvim-lspconfig' -- configurations for Nvim LSP
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'

	-- For Luasnip users
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'

	vim.g.completeopt="menu,menuone,noselect"	
	local cmp = require'cmp'
 	cmp.setup({
	snippet = {expand = function(args)
        	require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,},

    	mapping = cmp.mapping.preset.insert({
      		['<C-b>'] = cmp.mapping.scroll_docs(-4),
      		['<C-f>'] = cmp.mapping.scroll_docs(4),
      		['<C-Space>'] = cmp.mapping.complete(),
      		['<C-e>'] = cmp.mapping.abort(),

		-- Accept currently selected item. 
		-- Set `select` to `false` to only confirm explicitly selected items.
      		['<CR>'] = cmp.mapping.confirm({select = true} ), } ),

    	sources = cmp.config.sources({
      		{name = 'nvim_lsp'},
		 
		-- For luasnip users
      		{name = 'luasnip'},},
		{ {name = 'buffer'},})})

	-- Set configuration for specific filetype.
  	cmp.setup.filetype('gitcommit', {
    		sources = cmp.config.sources({
      			{name = 'cmp_git'}, -- You can specify the `cmp_git` source if you were installed it.
    				},{{name = 'buffer'}, } ) } )

  	-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  	cmp.setup.cmdline('/', {
    		mapping = cmp.mapping.preset.cmdline(),
    		sources = {
      {name = 'buffer'}}})

  	-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  	cmp.setup.cmdline(':', {
    	mapping = cmp.mapping.preset.cmdline(),
    		sources = cmp.config.sources({
      			{name = 'path'}}, {
      			{name = 'cmdline'}})})

  	-- Set up lspconfig.
  	local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  	-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.

  	-- For Pyright server setup
  	require'lspconfig'.pyright.setup {capabilities = capabilities,}

  	-- For Pylsp server setup
  	require'lspconfig'.pylsp.setup{capabilities = capabilities,}

end)

-- empty setup using defaults
require("nvim-tree").setup()

-- treesitter setup
require'nvim-treesitter.configs'.setup {
  	ensure_installed = { "c", "lua", "rust", "html", "javascript", "python", "css"},

  	-- Install parsers synchronously (only applied to `ensure_installed`)
  	sync_install = false,
  	auto_install = true,
	highlight = {enable = true,
		additional_vim_regex_highlighting = false,
  },
}

-- setting up tokyonight config
require("tokyonight").setup({
  	style = "night", -- The theme comes in three styles, `storm`, a darker variant `night` and `day`
  	transparent = false, -- Enable this to disable setting the background color
  	terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim

  	styles = {
    	-- Style to be applied to different syntax groups
    	-- Value is any valid attr-list value :help nvim_set_hl`	
    	comments = {italic = false},
    	keywords = {italic = false},
    	functions = {}, 
    	variables = {},
	
	-- Background styles. Can be "dark", "transparent" or "normal"
	sidebars = "dark", -- style for sidebars, see below
    	floats = "dark", -- style for floating windows
  	},
  	sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. 

	--For example: `["qf", "vista_kind", "terminal", "packer"]`
	-- Adjusts the brightness of the colors of the **Day** style. Number betwen 0 and 1, from dull to vibrant colors
  	day_brightness = 0.3,

	-- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. 
	-- Should work with the standard **StatusLine** and **LuaLine**.

  	hide_inactive_statusline = false, 
  	dim_inactive = false, -- dims inactive windows
  	lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

  	--- You can override specific color groups to use other groups or a hex color
  	--- fucntion will be called with a ColorScheme table
  	---@param colors ColorScheme
  	on_colors = function(colors) end,

  	--- You can override specific highlights to use other groups or a hex color
  	--- fucntion will be called with a Highlights and ColorScheme table
  	---@param highlights Highlights
  	---@param colors ColorScheme
  	on_highlights = function(highlights, colors) end,
})

-- Telescope config setup 
require('telescope').setup(
{ defaults = { layout_config = {
		horizontal = { preview_width = 0.65 } } }
	}
)

-- nvim-web-devicons setup
require'nvim-web-devicons'.setup{
	default = true;
}
--require'nvim-web-devicons'.get_icons()

-- setup pyright LSP
require'lspconfig'.pyright.setup{}
require'lspconfig'.pylsp.setup{}

vim.cmd[[colorscheme tokyonight]]
vim.api.nvim_set_hl(0, 'TSVariable', {fg = "#E8EDDF"})
