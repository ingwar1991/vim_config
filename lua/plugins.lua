return {
    --  Styles
    {
        'shaunsingh/nord.nvim',
--        'folke/tokyonight.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd [[colorscheme nord]]
        end
    },

    {
		'nvim-telescope/telescope.nvim',
        version = '0.1.1',
		dependencies = {
            'nvim-lua/plenary.nvim'
        }
	},


--  Parser
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },
	'nvim-treesitter/playground',

	'ThePrimeagen/harpoon',
	'mbbill/undotree',
	'tpope/vim-fugitive',

--  File manager
    'nvim-tree/nvim-web-devicons',
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = 'nvim-web-devicons',
    },

    'nvim-lualine/lualine.nvim',

    'neovim/nvim-lspconfig',             -- Required
    'lspcontainers/lspcontainers.nvim',
	
    'hrsh7th/nvim-cmp',     -- Required
    'hrsh7th/cmp-nvim-lsp', -- Required
    'L3MON4D3/LuaSnip',     -- Required
    'saadparwaiz1/cmp_luasnip',
--    'rafamadriz/friendly-snippets',

    'github/copilot.vim',
--    {
--		'VonHeikemen/lsp-zero.nvim',
--		branch = 'v2.x',
--		dependencies = {
--			-- LSP Support
--			'neovim/nvim-lspconfig',             -- Required
--            'lspcontainers/lspcontainers.nvim',
----			{                                      -- Optional
----				'williamboman/mason.nvim',
----				build = ':MasonUpdate'
----			},
----			'williamboman/mason-lspconfig.nvim', -- Optional
--
--			-- Autocompletion
--			'hrsh7th/nvim-cmp',     -- Required
--			'hrsh7th/cmp-nvim-lsp', -- Required
--			'L3MON4D3/LuaSnip',     -- Required
--
--            -- Snippets
--            'saadparwaiz1/cmp_luasnip',
--            'rafamadriz/friendly-snippets',
--		}
--	}
}
