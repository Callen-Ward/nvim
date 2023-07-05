vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('plugins')
require('settings')
require('mappings')
require('plugin_config')
require('lsp')
require('autocmds')

if vim.g.neovide then
    require('neovide.neovide')
else
    require('neovide.notneovide')
end
