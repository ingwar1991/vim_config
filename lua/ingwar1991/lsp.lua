local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local luasnip = require('luasnip')

cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    }, 
    mapping = {
        ['<C-k>'] =  cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<C-j>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-c>'] = cmp.mapping.close(),
        ['<C-y>'] = cmp.mapping.confirm({ 
            behavior = cmp.ConfirmBehavior.Replace,
            select = false 
        }),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        --{ name = 'vsnip' },
        --{ name = 'buffer' },
        --{ name = 'path' },
    },
}

local lspconfig = require('lspconfig')
local lspcontainers = require('lspcontainers')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.bashls.setup {
    before_init = function(params)
        params.processId = vim.NIL
    end,
    cmd = require'lspcontainers'.command('bashls'),
    root_dir = require'lspconfig/util'.root_pattern(".git", vim.fn.getcwd()),
	capabilities = capabilities
}

lspconfig.dockerls.setup {
    before_init = function(params)
        params.processId = vim.NIL
    end,
    cmd = require'lspcontainers'.command('dockerls'),
    root_dir = require'lspconfig/util'.root_pattern(".git", vim.fn.getcwd()),
	capabilities = capabilities
}

lspconfig.gopls.setup {
    cmd = require'lspcontainers'.command('gopls'),
	capabilities = capabilities
}

lspconfig.html.setup {
    before_init = function(params)
        params.processId = vim.NIL
    end,
    cmd = require'lspcontainers'.command('html'),
    root_dir = require'lspconfig/util'.root_pattern(".git", vim.fn.getcwd()),
	capabilities = capabilities
}

lspconfig.intelephense.setup {
    before_init = function(params)
        params.processId = vim.NIL
    end,
    cmd = require'lspcontainers'.command('intelephense'),
    root_dir = require'lspconfig/util'.root_pattern("composer.json", ".git", vim.fn.getcwd()),
	capabilities = capabilities
}

lspconfig.jsonls.setup {
    before_init = function(params)
        params.processId = vim.NIL
    end,
    cmd = require'lspcontainers'.command('jsonls'),
    root_dir = require'lspconfig/util'.root_pattern(".git", vim.fn.getcwd()),
	capabilities = capabilities
}

lspconfig.pylsp.setup {
    cmd = require'lspcontainers'.command('pylsp'),
	capabilities = capabilities
}

--lspconfig.sumneko_lua.setup {
--    cmd = require'lspcontainers'.command('sumneko_lua'),
--}

lspconfig.tsserver.setup {
    before_init = function(params)
        params.processId = vim.NIL
    end,
    cmd = require'lspcontainers'.command('tsserver'),
    root_dir = require'lspconfig/util'.root_pattern(".git", vim.fn.getcwd()),
	capabilities = capabilities
}

lspconfig.yamlls.setup {
    before_init = function(params)
        params.processId = vim.NIL
    end,
    cmd = require'lspcontainers'.command('yamlls'),
    root_dir = require'lspconfig/util'.root_pattern(".git", vim.fn.getcwd()),
	capabilities = capabilities
}

lspconfig.astro.setup {
    cmd = require'lspcontainers'.command('astro', {
        image = 'astro-lsp'
    }),
	capabilities = capabilities
}
