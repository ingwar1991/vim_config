require'cmp'.setup {
    sources = {
        { name = 'nvim_lsp' }
    }
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
