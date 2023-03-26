require('nvim-treesitter.configs').setup {
    ensure_installed = { 'lua', 'rust', 'typescript', 'javascript' },
    auto_install = false,

    highlight = {
        enable = true
    },
    indent = {
        enable = true
    }
}

require('lualine').setup {
    options = {
        component_separators = { left = '|', right = '|' },
        section_separators = { left = '', right = '' },
        ignore_focus = { 'NvimTree', 'TelescopePrompt' },
        globalstatus = true,
    },
    sections = {
        lualine_c = { '%f' },
        lualine_x = { 'b:toggle_number', 'encoding', 'fileformat', 'filetype' }
    }
}

require('bufferline').setup {
    options = {
        mode = 'tabs'
    }
}

local cmp = require('cmp')
cmp.setup({
    preselect = cmp.PreselectMode.None,
    snippet = {
        expand = function(args)
            vim.fn['vsnip#anonymous'](args.body)
        end,
    },
    mapping = {
            ['<C-p>'] = cmp.mapping.select_prev_item(),
            ['<C-n>'] = cmp.mapping.select_next_item(),
            ['<S-Tab>'] = cmp.mapping.select_prev_item(),
            ['<Tab>'] = cmp.mapping.select_next_item(),
            ['<C-d>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.close(),
            ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        }),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
        { name = 'path' },
        { name = 'buffer' },
    },
})

require('toggleterm').setup {
    size = 20,
    open_mapping = [[<C-CR>]],
    autochdir = true,
    shade_terminals = false,
    start_in_insert = true,
    insert_mappings = true,
    persist_mode = false,
    direction = 'horizontal',
    float_opts = {
        winblend = 0,
        border = 'single',
    },
}

require('nvim-tree').setup {
    actions = {
        change_dir = {
            global = true
        }
    }
}

require('nvim-web-devicons').setup {}
require('nvim-autopairs').setup {}
require('colorizer').setup()