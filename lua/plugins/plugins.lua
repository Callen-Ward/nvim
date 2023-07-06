return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- library
    use 'nvim-lua/plenary.nvim'

    -- misc
    use 'lukas-reineke/indent-blankline.nvim'
    use { 'lewis6991/gitsigns.nvim', tag = 'release' }
    use 'preservim/nerdcommenter'
    use 'norcalli/nvim-colorizer.lua'
    use 'nvim-lualine/lualine.nvim'
    use 'akinsho/bufferline.nvim'
    use 'windwp/nvim-autopairs'
    use 'akinsho/toggleterm.nvim'

    -- themes
    use 'folke/tokyonight.nvim'

    -- NvimTree
    use 'nvim-tree/nvim-tree.lua'
    use 'nvim-tree/nvim-web-devicons'

    -- telescope
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run =
        'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    }
    use { 'nvim-telescope/telescope.nvim', branch = '0.1.x' }

    -- treesitter
    use 'nvim-treesitter/nvim-treesitter'

    -- lsp
    use 'neovim/nvim-lspconfig'
    use 'jose-elias-alvarez/null-ls.nvim'
    use {
        'williamboman/mason.nvim',
        run = ':MasonUpdate'
    }
    use 'williamboman/mason-lspconfig.nvim'
    use 'jay-babu/mason-null-ls.nvim'

    -- autocomplete
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'

    -- snippets
    use 'hrsh7th/vim-vsnip'
    use 'rafamadriz/friendly-snippets'
end)
