-- Override the bundled ledger ftplugin, which sets ';%s'. hledger accepts both
-- ; and # for comments; prefer #. Must live in after/ftplugin to win the ordering.
vim.opt_local.commentstring = '# %s'
