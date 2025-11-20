-- LSP configuration

require('mason').setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

require('mason-lspconfig').setup({
  ensure_installed = {
    'lua_ls',           -- Lua
    'hls',              -- Haskell
    'ruby_lsp',         -- Ruby
    'ts_ls',            -- TypeScript/JavaScript
    'pyright',          -- Python
    'html',             -- HTML
    'cssls',            -- CSS
    'jsonls',           -- JSON
    'yamlls',           -- YAML
    'marksman',         -- Markdown
    'clangd',           -- C/C++
  },
  automatic_installation = true,
  automatic_enable = { exclude = { "jdtls" } }
})

local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered()
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' })
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
  }, {
    { name = 'buffer' }
  })
})

cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- LSP capabilities for completion
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function(client, bufnr)
  local opts = { buffer = bufnr }

  -- Code actions (for importing missing classes, quick fixes, etc.)
  vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, opts)

  -- Go to definition/declaration
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)

  -- Show documentation
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

  -- Go to implementation
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)

  -- Show references
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)

  -- Rename symbol
  vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, opts)

  -- Show signature help
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)

  -- Diagnostics
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', '<Leader>d', vim.diagnostic.open_float, opts)
end

local function setup_server(name, config)
  config = config or {}
  config.capabilities = capabilities
  config.on_attach = on_attach

  vim.lsp.config[name] = config
  vim.lsp.enable(name)
end

setup_server('lua_ls', {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  settings = {
    Lua = {
      diagnostics = {
        globals = {'vim'}
      }
    }
  }
})

setup_server('hls', {
  cmd = { 'haskell-language-server-wrapper', '--lsp' },
  filetypes = { 'haskell', 'lhaskell', 'cabal' }
})

setup_server('ruby_lsp', {
  cmd = { 'ruby-lsp' },
  filetypes = { 'ruby' }
})

setup_server('ts_ls', {
  cmd = { 'typescript-language-server', '--stdio' },
  filetypes = { 'javascript', 'javascriptreact', 'javascript.jsx', 'typescript', 'typescriptreact', 'typescript.tsx' }
})

setup_server('pyright', {
  cmd = { 'pyright-langserver', '--stdio' },
  filetypes = { 'python' }
})

setup_server('html', {
  cmd = { 'vscode-html-language-server', '--stdio' },
  filetypes = { 'html' }
})

setup_server('cssls', {
  cmd = { 'vscode-css-language-server', '--stdio' },
  filetypes = { 'css', 'scss', 'less' }
})

setup_server('jsonls', {
  cmd = { 'vscode-json-language-server', '--stdio' },
  filetypes = { 'json', 'jsonc' }
})

setup_server('yamlls', {
  cmd = { 'yaml-language-server', '--stdio' },
  filetypes = { 'yaml', 'yaml.docker-compose' }
})

setup_server('marksman', {
  cmd = { 'marksman', 'server' },
  filetypes = { 'markdown' },
  settings = {},
  flags = {
    debounce_text_changes = 150,
  },
  on_exit = function(code, signal, client_id)
    if code == 143 then
      vim.notify("Marksman LSP restarting after crash", vim.log.levels.WARN)
      vim.schedule(function()
        vim.cmd('LspRestart marksman')
      end)
    end
  end
})

setup_server('clangd', {
  cmd = { 'clangd' },
  filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto' }
})

local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
vim.diagnostic.config({
  virtual_text = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = signs.Error,
      [vim.diagnostic.severity.WARN] = signs.Warn,
      [vim.diagnostic.severity.HINT] = signs.Hint,
      [vim.diagnostic.severity.INFO] = signs.Info
    }
  },
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})

return {
  on_attach = on_attach,
  capabilities = capabilities
}
