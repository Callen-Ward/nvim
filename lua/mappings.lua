vim.g.mapleader = ','

local map_opts = { noremap = true, silent = true }
local M = {}

-- copy to system clipboard
vim.keymap.set('v', '<c-c>', '"+y', map_opts)

-- use alt+j/k to move current line or selection
vim.keymap.set('n', '<M-j>', ':m +1<CR>==', map_opts)
vim.keymap.set('n', '<M-k>', ':m -2<CR>==', map_opts)
vim.keymap.set('v', '<M-j>', ':m \'>+1<CR>gv=gv', map_opts)
vim.keymap.set('v', '<M-k>', ':m \'<-2<CR>gv=gv', map_opts)

-- switch between virtual lines with j and k
vim.keymap.set('n', 'j', 'gj', map_opts)
vim.keymap.set('n', 'k', 'gk', map_opts)

-- disable search highlighting
vim.keymap.set('n', '<leader>/', ':noh<CR>', map_opts)

-- terminal
vim.keymap.set('t', '<C-n>', '<C-\\><C-n>', map_opts)
vim.keymap.set('t', '<C-w>', '<C-\\><C-n><C-w>', map_opts)

-- diagnostics
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, map_opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, map_opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, map_opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, map_opts)

-- nvim-tree
vim.keymap.set('n', '<c-n>', ':NvimTreeToggle<CR>', map_opts)
vim.keymap.set('n', '<leader>n', ':NvimTreeFocus<CR>', map_opts)
vim.keymap.set('n', '<M-n>', ':NvimTreeFindFile<CR>', map_opts)

-- NERDCommenter
-- set twice for compatibility
vim.keymap.set('i', '<c-_>', '<ESC><PLUG>NERDCommenterTogglei', map_opts)
vim.keymap.set('n', '<c-_>', '<PLUG>NERDCommenterToggle', map_opts)
vim.keymap.set('v', '<c-_>', '<PLUG>NERDCommenterToggle', map_opts)

vim.keymap.set('i', '<c-/>', '<ESC><PLUG>NERDCommenterTogglei', map_opts)
vim.keymap.set('n', '<c-/>', '<PLUG>NERDCommenterToggle', map_opts)
vim.keymap.set('v', '<c-/>', '<PLUG>NERDCommenterToggle', map_opts)

-- telescope
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<c-p>', builtin.find_files, map_opts)
vim.keymap.set('n', '<leader>fb', builtin.buffers, map_opts)
vim.keymap.set('n', '<leader>fg', builtin.live_grep, map_opts)

-- vsnip
vim.cmd('inoremap <expr> <Tab>   vsnip#jumpable(1)  ? "<Plug>(vsnip-jump-next)" : "<Tab>"')
vim.cmd('snoremap <expr> <Tab>   vsnip#jumpable(1)  ? "<Plug>(vsnip-jump-next)" : "<Tab>"')
vim.cmd('inoremap <expr> <S-Tab> vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : "<S-Tab>"')
vim.cmd('snoremap <expr> <S-Tab> vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : "<S-Tab>"')

-- lsp on_attach
M.set_lsp_mappings = function(bufopts, format)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder,
        bufopts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>f', function() format() end, bufopts)
end

return M
