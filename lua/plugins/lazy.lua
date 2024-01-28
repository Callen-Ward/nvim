-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
    -- library
    'nvim-lua/plenary.nvim',

    -- misc
    'lukas-reineke/indent-blankline.nvim',
    {
        'lewis6991/gitsigns.nvim',
        tag = 'release',
    },
    'preservim/nerdcommenter',
    'norcalli/nvim-colorizer.lua',
    'nvim-lualine/lualine.nvim',
    'windwp/nvim-autopairs',
    'akinsho/toggleterm.nvim',

    -- themes
    'folke/tokyonight.nvim',

    -- tvimTree
    'nvim-tree/nvim-tree.lua',
    'nvim-tree/nvim-web-devicons',

    -- telescope,
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build =
        'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    },
    { 'nvim-telescope/telescope.nvim', branch = '0.1.x' },

    -- treesitter
    'nvim-treesitter/nvim-treesitter',
    'nvim-treesitter/nvim-treesitter-context',

    -- lsp,
    'neovim/nvim-lspconfig',
    'jose-elias-alvarez/null-ls.nvim',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'jay-babu/mason-null-ls.nvim',

    -- autocomplete
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-buffer',

    -- snippets
    'hrsh7th/vim-vsnip',
    'rafamadriz/friendly-snippets',
}
