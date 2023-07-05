require('tokyonight').setup {
    lualine_bold = true,
}

vim.cmd.colorscheme('tokyonight-moon')

-- transparent = true in setup breaks bufferline, setting bg manually fixes that
-- change gitsigns highlighting to match theme
vim.cmd([[
    hi Normal guibg=#222335
    hi GitSignsAdd guifg=#c3e88d
    hi DiffDelete guifg=#c53b53
]])
