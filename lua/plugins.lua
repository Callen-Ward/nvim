local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

-- library
Plug('nvim-lua/plenary.nvim')

-- misc
Plug('Yggdroot/indentLine')
Plug('airblade/vim-gitgutter')
Plug('sheerun/vim-polyglot')
Plug('preservim/nerdcommenter')
Plug('norcalli/nvim-colorizer.lua')
Plug('hrsh7th/vim-vsnip')
Plug('nvim-lualine/lualine.nvim')
Plug('akinsho/bufferline.nvim')
Plug('windwp/nvim-autopairs')
Plug('akinsho/toggleterm.nvim')

-- NvimTree
Plug('nvim-tree/nvim-tree.lua')
Plug('nvim-tree/nvim-web-devicons')

-- telescope
Plug('nvim-telescope/telescope-fzf-native.nvim', {
        ['do'] = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
})
Plug('nvim-telescope/telescope.nvim', { branch = '0.1.x' })

-- treesitter
Plug('nvim-treesitter/nvim-treesitter')

-- Themes
Plug('joshdick/onedark.vim')
Plug('folke/tokyonight.nvim', { branch = 'main' })

-- lsp
Plug('neovim/nvim-lspconfig')
Plug('jose-elias-alvarez/null-ls.nvim')

-- autocomplete
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-vsnip')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-buffer')

-- snippets
Plug('rafamadriz/friendly-snippets')

-- rust
Plug('simrat39/rust-tools.nvim')

vim.call('plug#end')
