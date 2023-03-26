require('tokyonight').setup {
    lualine_bold = true,
}

vim.cmd.colorscheme('tokyonight-moon')

-- transparent = true in setup breaks bufferline, setting bg manually fixes that
-- remove the background colour behind diagnostic messages
vim.cmd([[
    highlight Normal guibg=#222335
    highlight DiagnosticVirtualTextError guibg=none
    highlight DiagnosticVirtualTextWarn guibg=none
    highlight DiagnosticVirtualTextInfo guibg=none
    highlight DiagnosticVirtualTextHint guibg=none
]])
