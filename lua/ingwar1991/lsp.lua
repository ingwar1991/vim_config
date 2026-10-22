local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local luasnip = require('luasnip')

local border = "rounded"

-- override LSP floating preview to always use a border
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

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
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
}

local lspcontainers = require('lspcontainers')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config('bashls', {
    before_init = function(params)
        params.processId = vim.NIL
    end,
    cmd = lspcontainers.command('bashls'),
    capabilities = capabilities,
})
vim.lsp.enable('bashls')

vim.lsp.config('dockerls', {
    before_init = function(params)
        params.processId = vim.NIL
    end,
    cmd = lspcontainers.command('dockerls'),
    capabilities = capabilities,
})
vim.lsp.enable('dockerls')

vim.lsp.config('gopls', {
    cmd = lspcontainers.command('gopls'),
    capabilities = capabilities,
})
vim.lsp.enable('gopls')

vim.lsp.config('html', {
    before_init = function(params)
        params.processId = vim.NIL
    end,
    cmd = lspcontainers.command('html'),
    capabilities = capabilities,
})
vim.lsp.enable('html')

vim.lsp.config('intelephense', {
    before_init = function(params)
        params.processId = vim.NIL
    end,
    cmd = lspcontainers.command('intelephense', {
        docker_options = {
            ["--memory"] = "4g",
            ["--memory-swap"] = "4g",
        },
    }),
    capabilities = capabilities,
})
vim.lsp.enable('intelephense')

vim.lsp.config('jsonls', {
    before_init = function(params)
        params.processId = vim.NIL
    end,
    cmd = lspcontainers.command('jsonls'),
    capabilities = capabilities,
})
vim.lsp.enable('jsonls')

vim.lsp.config('pylsp', {
    cmd = lspcontainers.command('pylsp'),
    capabilities = capabilities,
})
vim.lsp.enable('pylsp')

-- vim.lsp.config('ts_ls', {
--     before_init = function(params)
--         params.processId = vim.NIL
--     end,
--     cmd = lspcontainers.command('tsserver'),
--     capabilities = capabilities,
-- })
-- vim.lsp.enable('ts_ls')

vim.lsp.config('yamlls', {
    before_init = function(params)
        params.processId = vim.NIL
    end,
    cmd = lspcontainers.command('yamlls'),
    capabilities = capabilities,
})
vim.lsp.enable('yamlls')

vim.lsp.config('terraformls', {
    cmd = lspcontainers.command('terraformls'),
    filetypes = { "hcl", "tf", "terraform", "tfvars" },
    capabilities = capabilities,
})
vim.lsp.enable('terraformls')

-- vim.lsp.config('astro', {
--     cmd = lspcontainers.command('astro', { image = 'astro-lsp' }),
--     capabilities = capabilities,
-- })
-- vim.lsp.enable('astro')
--
-- vim.lsp.config('phpactor', {
--     cmd = lspcontainers.command('phpactor'),
--     capabilities = capabilities,
-- })
-- vim.lsp.enable('phpactor')
