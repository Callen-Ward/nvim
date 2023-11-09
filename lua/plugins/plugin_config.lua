local mappings = require('mappings')

require('ibl').setup {
    scope = { enabled = false }
}

require('nvim-treesitter.configs').setup {
    ensure_installed = { 'lua', 'rust', 'typescript', 'javascript' },
    sync_install = false,
    auto_install = true,
    ignore_install = {},
    modules = {},

    highlight = {
        enable = true,
        disable = { 'json' }
    },
    indent = {
        enable = true
    },
    incremental_selection = {
        enable = true,
        keymaps = mappings.treesitter_keymaps,
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
        lualine_b = { 'branch', 'b:gitsigns_status', 'diagnostics' },
        lualine_c = { '%f' },
        lualine_x = { 'b:toggle_number', 'encoding', 'fileformat', 'filetype' }
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
    mapping = mappings.cmp_mapping,
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
    },
    git = {
        ignore = false
    }
}

require('gitsigns').setup {
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        mappings.set_gitsigns_mappings(bufopts, gs)
    end
}

require('mason').setup {
    ui = {
        icons = {
            package_installed = '✓',
            package_pending = '➜',
            package_uninstalled = '✗'
        }
    }
}

require('nvim-web-devicons').setup {}
require('nvim-autopairs').setup {}
require('colorizer').setup()
