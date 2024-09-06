return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { "hrsh7th/nvim-cmp" },
        },
        config = function()
            -- LSP
            local telescope = require('telescope.builtin')

            local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
            end

            vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float)

            vim.api.nvim_create_autocmd("LspAttach", {
                desc = "LSP action",
                callback = function(event)
                    local opts = { buffer = event.buf }
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                    vim.keymap.set('n', 'gd', function() telescope.lsp_definitions() end, opts)
                    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                    vim.keymap.set('n', 'gi', telescope.lsp_implementations, opts)
                    vim.keymap.set('n', '<leader>D', telescope.lsp_type_definitions, opts)
                    vim.keymap.set('n', 'gr', telescope.lsp_references, opts)
                    vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)
                    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
                    vim.keymap.set({ 'n', 'x' }, '<leader>lf', function() vim.lsp.buf.format({ async = true }) end, opts)
                    vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action, opts)
                    vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, opts)
                end
            })

            local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities();
            local default_setup = function(server)
                require("lspconfig")[server].setup({
                    capabilities = lsp_capabilities,
                })
            end

            require('mason').setup()
            require('mason-lspconfig').setup({
                ensure_installed = { 'lua_ls', 'cssls', 'tsserver', 'html' },
                handlers = {
                    default_setup,
                },
            })

            --CMP
            local cmp = require('cmp')
            local lspkind = require('lspkind')
            local cmp_autopairs = require('nvim-autopairs.completion.cmp');

            cmp.event:on(
                "confirm_done",
                cmp_autopairs.on_confirm_done()
            )

            cmp.setup({
                sources = {
                    { name = "nvim_lsp" }
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                    ['<C-Space>'] = cmp.mapping.complete(),
                }),
                preselect = 'item',
                completion = {
                    completeopt = 'menu,menuone,noinsert'
                },
                window = {
                    completion = cmp.config.window.bordered({
                        border = "none",
                        winhighlight = "Normal:CmpPMenu,FloatBoarder:CmpBorder,CursorLine:CursorLine,Search:NONE",
                        side_padding = 0,
                        col_offset = -3,
                    })
                },
                formatting = {
                    fields = { "kind", "abbr", "menu" },
                    format = function(entry, vim_item)
                        local kind = lspkind.cmp_format({
                            mode = "symbol_text",
                            show_labelDetails = true,
                            maxwidth = 50,
                        })(entry, vim_item)
                        local strings = vim.split(kind.kind, "%s", { trimempty = true })
                        kind.kind = " " .. strings[1] .. " "
                        kind.menu = " " .. strings[2]
                        return kind
                    end,
                },
            })
        end
    },
}
