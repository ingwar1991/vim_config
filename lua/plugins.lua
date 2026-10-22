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
        version = '0.1.8',
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

--    'github/copilot.vim',

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

--	Xdebug  
    'vim-vdebug/vdebug',

--  Database
    {
        'kristijanhusak/vim-dadbod-ui',
        dependencies = {
            { 'tpope/vim-dadbod', lazy = true },
            { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
        },
        cmd = {
            'DBUI',
            'DBUIToggle',
            'DBUIAddConnection',
            'DBUIFindBuffer',
        },
        init = function()
            -- Your DBUI configuration
            vim.g.db_ui_use_nerd_fonts = 1
        end,
    },
    {
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup()
      end
    },

--  Git
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup({
                -- Configuration options can go here
                signs = {
                    add = {hl = 'GitSignsAdd', text = '+', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn'},
                    change = {hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn'},
                    delete = {hl = 'GitSignsDelete', text = '-', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn'},
                    topdelete = {hl = 'GitSignsDelete', text = '_', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn'},
                    changedelete = {hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn'},
                },
                -- Set keymaps for easy navigation (optional but highly recommended)
                on_attach = function(bufnr)
                    local gs = package.loaded.gitsigns

                    local function map(mode, lhs, rhs, desc)
                        vim.keymap.set(mode, lhs, rhs, {buffer = bufnr, desc = desc})
                    end

                    -- Navigation
                    map('n', ']h', function() gs.next_hunk() end, 'Go to next hunk')
                    map('n', '[h', function() gs.prev_hunk() end, 'Go to previous hunk')

                    -- Actions
                    map('n', '<leader>hs', ':GitsignsStageHunk<CR>', 'Stage current hunk')
                    map('n', '<leader>hr', ':GitsignsResetHunk<CR>', 'Reset current hunk')
                    map('v', '<leader>hs', function() gs.stage_hunk('v') end, 'Stage selected hunk')
                    map('v', '<leader>hr', function() gs.reset_hunk('v') end, 'Reset selected hunk')
                    map('n', '<leader>hu', ':GitsignsUndoStageHunk<CR>', 'Undo staging of last hunk')
                    map('n', '<leader>hp', ':GitsignsPreviewHunk<CR>', 'Preview current hunk')
                end,
            })
        end
    },
}
