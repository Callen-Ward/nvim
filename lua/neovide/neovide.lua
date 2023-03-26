vim.opt.guifont = 'FiraCode Nerd Font:h11'

vim.g.neovide_hide_mouse_when_typing = true
vim.g.neovide_underline_automatic_scaling = true
vim.g.neovide_scroll_animation_length = 0.3

vim.g.neovide_transparency = 1
vim.g.floating_blur_amount_x = 0
vim.g.floating_blur_amount_y = 0
vim.opt.winblend = 20
vim.opt.pumblend = 20

vim.g.neovide_cursor_animation_length = 0.08
vim.g.neovide_cursor_trail_size = 0.5
vim.g.neovide_cursor_vfx_mode = ''

require('neovide.mappings')
