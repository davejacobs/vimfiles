vim.opt_local.commentstring = '# %s'
vim.lsp.start({ name = "soarlsp", cmd = { "soarlsp" } })
vim.keymap.set({ 'n', 'v' }, '=', function()
  require("conform").format({ async = true, lsp_fallback = false })
end, { buffer = true, desc = "Format" })
