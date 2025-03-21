local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

--- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

-- bootstrap a packer install, e.g. if on a server
local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)

	-- packer can manage itself
	use 'wbthomason/packer.nvim'

    use {
        "stevearc/conform.nvim",
        config = function()
            require("conform").setup()
        end,
    }

	-- fonts for lualine and lualine
	use 'nvim-tree/nvim-web-devicons'

    -- lualine
	use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        options = {
            theme = 'tokyonight'
        }
    }

    -- multiple cursors

    -- copilot
    use { "zbirenbaum/copilot.lua" }

    -- use {
    --     "zbirenbaum/copilot-cmp",
    --     after = { "copilot.lua" },
    --     config = function ()
    --         require("copilot_cmp").setup()
    --     end
    -- }

    -- telescope 
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    -- Snakemake
    use {
        'snakemake/snakemake',
        rtp = 'misc/vim/',
        ft = {'snakemake'}
    }

    -- webapi support (e.g. for rust playground)
    use ('mattn/webapi-vim')

    -- R support
    use ('jalvesaq/Nvim-R')

    -- code commenting
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- tree sitter for syntax highlighting, etc.
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- undo tree 
    -- use ('mbbill/undotree')

    -- Git support
    use ('tpope/vim-fugitive')

    -- rust support
    -- use ('rust-lang/rust.vim')
    use { 'simrat39/rust-tools.nvim' }
    -- use {
        --     'mrcjkb/rustaceanvim',
        --     version = '^4',
        --     ft = { 'rust' },
        -- }

        -- easy LSP setup
        use {
            'VonHeikemen/lsp-zero.nvim',
            branch = 'v1.x',
            requires = {
                -- LSP Support
                {'neovim/nvim-lspconfig'},             -- Required
                {'williamboman/mason.nvim'},           -- Optional
                {'williamboman/mason-lspconfig.nvim'}, -- Optional

                -- Autocompletion
                {'hrsh7th/nvim-cmp'},         -- Required
                {'hrsh7th/cmp-nvim-lsp'},     -- Required
                {'hrsh7th/cmp-buffer'},       -- Optional
                {'hrsh7th/cmp-path'},         -- Optional
                {'saadparwaiz1/cmp_luasnip'}, -- Optional
                {'hrsh7th/cmp-nvim-lua'},     -- Optional

                -- Snippets
                {'L3MON4D3/LuaSnip'},             -- Required
                {'rafamadriz/friendly-snippets'}, -- Optional
            }
        }

        -- LATeX support
        use 'lervag/vimtex'

        -- yank for *macs-yank ring
        use("gbprod/yanky.nvim") require("yanky").setup({
            ring = {
                history_length = 100,
                storage = "shada",
                sync_with_numbered_registers = true,
                cancel_event = "update",

            },
            highlight = {
                on_put = true,
                on_yank = true,
                timer = 500,
            },
        })

        -- Stan syntax highlighting
        use 'eigenfoo/stan-vim'

        -- Eidos/SLiM syntax highlighting
        use 'vsbuffalo/eidos.vim'

        -- colors
        use({
            'rose-pine/neovim',
            as = 'rose-pine',
            config = function()
                vim.cmd('colorscheme rose-pine')
            end
        })

        use {
            "folke/tokyonight.nvim",
            lazy = false,
            priority = 1000,
            opts = {},
        }

        use "rebelot/kanagawa.nvim"

        use { "catppuccin/nvim", as = "catppuccin" }



    end)
