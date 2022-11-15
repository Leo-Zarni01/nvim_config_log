vim.g.mapleader = " "
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', { noremap = true })
vim.o.relativenumber = true


require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	--zen-mode
	use {"folke/zen-mode.nvim",
  		config = function()
    			require("zen-mode").setup {
    		}
  		end
			}

	use { "folke/twilight.nvim",
  		config = function()
    			require("twilight").setup {
      			-- your configuration comes here
      			-- or leave it empty to use the default settings
      			-- refer to the configuration section below
    		}
  		end
			}

	-- bufferline 
	use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}	

	-- nvim termtoggle 
	use {"akinsho/toggleterm.nvim", tag = '*', config = function()
  		require("toggleterm").setup()
			end}	

	-- colorscheme
	use 'folke/tokyonight.nvim'

	-- autopair
	use {"windwp/nvim-autopairs", config = function() 
		require("nvim-autopairs").setup {} end}

	-- treesitter plugin 
	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
	use 'p00f/nvim-ts-rainbow'
	use 'nvim-treesitter/playground'

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
	local capabilities = require("cmp_nvim_lsp").default_capabilities()	
	-- overriding language client capabilities for html
	--capabilities.textDocument.completion.completionItem.snippetSupport = true

	-- For Vscode html server setup -- not working 14/9/2022
	require'lspconfig'.html.setup {capabilities = capabilities,
		cmd = { "vscode-html-language-server", "--stdio" }	
	
		}	

	-- For css server setup
	require'lspconfig'.cssls.setup {capabilities = capabilities,}

	-- For Typescript server setup
	require'lspconfig'.tsserver.setup{capabilities = capabilities,}

  	-- For Pyright server setup
  	require'lspconfig'.pyright.setup {capabilities = capabilities,}

  	-- For Pylsp server setup
  	require'lspconfig'.pylsp.setup{capabilities = capabilities,}

	-- For marksman server setup
	require'lspconfig'.marksman.setup{capabilities = capabilities,}
end)

-- empty setup using defaults
require("nvim-tree").setup()

-- treesitter setup
require'nvim-treesitter.configs'.setup {
  	ensure_installed = { "c", "lua", "rust", "html", "javascript", "python", "css", "markdown"},

  	-- Install parsers synchronously (only applied to `ensure_installed`)
  	sync_install = false,
  	auto_install = true,
	highlight = {enable = true,
		additional_vim_regex_highlighting = false,},

	rainbow = {
    		enable = true,
    		-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    		max_file_lines = nil, -- Do not enable for files with more than n lines, int
    		-- colors = {}, -- table of hex strings
    		-- termcolors = {} -- table of colour name strings
  },
	  playground = {
	    enable = true,
	    disable = {},
	    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
	    persist_queries = false, -- Whether the query persists across vim sessions
	    keybindings = {
	      toggle_query_editor = 'o',
	      toggle_hl_groups = 'i',
	      toggle_injected_languages = 't',
	      toggle_anonymous_nodes = 'a',
	      toggle_language_display = 'I',
	      focus_language = 'f',
	      unfocus_language = 'F',
	      update = 'R',
	      goto_node = '<cr>',
	      show_help = '?',
	    },
  }
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

-- setting up pyright
require'lspconfig'.pyright.setup{}

-- setting up Pylsp
require'lspconfig'.pylsp.setup{}

-- setting up Marksman
require'lspconfig'.marksman.setup{
}

-- setting up html
require'lspconfig'.html.setup{}

-- setting up css 
require'lspconfig'.cssls.setup{}

-- setting up typescript
require'lspconfig'.tsserver.setup{}

-- setting up LuaSnip 
local luasnip = require 'luasnip'

vim.cmd[[colorscheme tokyonight]]
vim.api.nvim_set_hl(0, '@variable', {fg = "#DECADE" })

-- setting up bufferline 
vim.opt.termguicolors = true
require("bufferline").setup{}

-- configuring nvim-tree-kyazdani
vim.cmd('nnoremap <space>e :NvimTreeToggle<CR>')

-- configuring nvim-zen-mode keybinding
vim.cmd('nnoremap <space>z :ZenMode<CR>')

-- disable lsp warning messages and signs 
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        signs = false,
        virtual_text = false,
        underline = false,
        update_in_insert = false,
      }
    )

-- toggle term config
require("toggleterm").setup{
  -- size can be a number or function which is passed the current terminal
  	size = 20,
  	open_mapping = [[<c-t>]],
  	hide_numbers = true, -- hide the number column in toggleterm buffers
  	shade_filetypes = {},
  	highlights = {
    		border = "Normal",
    		background = "Normal"},
  					
  	shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
  	shading_factor = 2, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  	start_in_insert = true,
  	insert_mappings = true, -- whether or not the open mapping applies in insert mode
  	--terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
  	persist_size = true,
  	-- persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
  	direction = 'float',
  	close_on_exit = true, -- close the terminal window when the process exits
  	shell = vim.o.shell, -- change the default shell
  	--auto_scroll = true, -- automatically scroll to the bottom on terminal output
  -- This field is only relevant if direction is set to 'float'
  	float_opts = {
    		border = 'curved',
    		winblend = 3,
  				},
			}

