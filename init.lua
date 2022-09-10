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
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })


  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.

  -- For Pyright server setup
  require'lspconfig'.pyright.setup {
    capabilities = capabilities,
  }

  -- For Pylsp server setup
  require'lspconfig'.pylsp.setup{
	capabilities = capabilities,
  }

end)

-- empty setup using defaults
require("nvim-tree").setup()

-- treesitter setup

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "rust", "html", "javascript", "python", "css"},

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

-- setup pyright LSP
require'lspconfig'.pyright.setup{}
require'lspconfig'.pylsp.setup{}

vim.cmd[[colorscheme tokyonight]]

