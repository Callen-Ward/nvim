require('tokyonight').setup {
    lualine_bold = true,
}

vim.cmd.colorscheme('tokyonight-moon')

-- transparent = true in setup breaks bufferline, setting bg manually fixes that
-- remove the background colour behind diagnostic messages
vim.cmd([[
    hi Normal guibg=#222335

    hi DiagnosticVirtualTextError guibg=none
    hi DiagnosticVirtualTextWarn guibg=none
    hi DiagnosticVirtualTextInfo guibg=none
    hi DiagnosticVirtualTextHint guibg=none

    hi GitSignsAdd guifg=#c3e88d
    hi DiffDelete guifg=#c53b53
]])
