vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4

-- Java-specific LSP keybindings
vim.keymap.set('n', '<Leader>oi', function()
  vim.lsp.buf.code_action({
    context = { only = { 'source.organizeImports' } },
    apply = true
  })
end, { buffer = true, desc = 'Organize imports' })
