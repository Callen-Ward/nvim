local map_opts = { noremap = true, silent = true }

-- paste from clipboard
vim.keymap.set('i', '<C-v>', '<Right><ESC>"+Pa', map_opts)

-- increase neovide_scale_factor by 0.1
vim.keymap.set('n', '<C-=>', function()
    local scalefactor = vim.g.neovide_scale_factor
    if scalefactor then
        vim.g.neovide_scale_factor = scalefactor + 0.1
    else
        vim.g.neovide_scale_factor = 1.1
    end
end, map_opts)

-- reset scale factor
vim.keymap.set('n', '<C-->', function() vim.g.neovide_scale_factor = 1 end, map_opts)
