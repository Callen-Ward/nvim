require('tokyonight').setup {
    lualine_bold = true,
}

vim.cmd.colorscheme('tokyonight-moon')

-- change gitsigns highlighting to match theme
vim.cmd([[
    hi GitSignsAdd guifg=#c3e88d
    hi DiffDelete guifg=#c53b53
]])
