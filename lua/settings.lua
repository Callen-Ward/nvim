-- functional
vim.opt.linebreak = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.scrolloff = 8
vim.opt.mousemodel = 'extend'
vim.opt.completeopt = { 'menuone', 'noinsert', 'noselect' }
vim.opt.shortmess = vim.opt.shortmess + 'c'

-- search
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmatch = true

-- cosmetic
vim.opt.showmode = false
vim.opt.number = true
vim.opt.wrap = false
vim.opt.signcolumn = 'yes'
vim.opt.showcmd = false
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.g.indentLine_char = '▏'
require('tokyonight_config')

if vim.g.neovide then
    require('neovide.neovide')
else
    require('neovide.notneovide')
end
