local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local lsp = require('lspconfig')

-- remove diagnostic characters from sign column and highlight line numbers of diagnostics
local dsigns = { 'DiagnosticSignError', 'DiagnosticSignWarn', 'DiagnosticSignHint', 'DiagnosticSignInfo' }
for _, s in pairs(dsigns) do
    vim.fn.sign_define(s, { text = '', texthl = s, numhl = s })
end

-- format the current buffer using null-ls config if available, otherwise use
-- any other available formatter
local function lsp_formatting(bufnr)
    vim.lsp.buf.format {
        filter = function(client)
            local null_ls = vim.lsp.get_active_clients({ name = 'null-ls' })[1]
            if (null_ls and vim.lsp.buf_is_attached(bufnr, null_ls.id)) then
                return client.name == 'null-ls'
            else
                return true
            end
        end
    }
end

local function on_attach(_, bufnr)
    -- keymaps
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
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
    vim.keymap.set('n', '<space>f', function() lsp_formatting() end, bufopts)

    -- format on save
    vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
        buffer = bufnr,
        callback = function() lsp_formatting(bufnr) end
    })
end

local null_ls = require('null-ls')
null_ls.setup { sources = { null_ls.builtins.formatting.prettier, } }

lsp.rust_analyzer.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

lsp.lua_ls.setup {
    settings = {
        Lua = {
            diagnostics = { globals = { 'vim', "awesome", "client", "root", "screen" } },
            workspace = {
                library = vim.api.nvim_get_runtime_file('', true),
                checkThirdParty = false
            },
            telemetry = { enable = false }
        }
    },
    on_attach = on_attach,
    capabilities = capabilities
}

lsp.tsserver.setup { on_attach = on_attach, capabilities = capabilities }

lsp.html.setup { on_attach = on_attach, capabilities = capabilities }

lsp.cssls.setup { on_attach = on_attach, capabilities = capabilities }
