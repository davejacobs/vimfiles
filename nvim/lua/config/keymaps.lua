-- Keybindings
-- Note: Leaders are set in init.lua before plugins load

-- kj - the easy way to escape insert mode
vim.keymap.set('i', 'kj', '<Esc>', { desc = 'Exit insert mode' })

-- Format entire file with modern formatter (with fallback to LSP/vim formatting)
vim.keymap.set('n', '<Leader>=', function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { desc = 'Format entire file' })

-- Get the convenience of 'o' in insert mode
vim.keymap.set('i', '<S-CR>', '<Esc>o', { desc = 'New line below in insert mode' })

-- Sudo - even if you didn't open the file as root
vim.keymap.set('c', 'w!!', '%!sudo tee > /dev/null %', { desc = 'Save with sudo' })

-- Easy splits and navigation
vim.keymap.set('n', '<Leader>s', ':split<CR>', { desc = 'Horizontal split' })
vim.keymap.set('n', '<Leader>v', ':vsplit<CR>', { desc = 'Vertical split' })

-- Window navigation
local window_nav_opts = { desc = 'Navigate windows' }
vim.keymap.set({ 'i', 'n', 'v' }, '<C-j>', '<C-w>j', window_nav_opts)
vim.keymap.set({ 'i', 'n', 'v' }, '<C-k>', '<C-w>k', window_nav_opts)
vim.keymap.set({ 'i', 'n', 'v' }, '<C-h>', '<C-w>h', window_nav_opts)
vim.keymap.set({ 'i', 'n', 'v' }, '<C-l>', '<C-w>l', window_nav_opts)

-- Search and text manipulation
vim.keymap.set('n', '<Leader>y', ':nohls<CR>', { desc = 'Clear search highlights' })
vim.keymap.set('n', '<C-y>', ':nohls<CR>', { desc = 'Clear search highlights' })
vim.keymap.set('v', '<Leader>p', ':!par -w 100<CR>', { desc = 'Format paragraph (visual)' })
vim.keymap.set('n', '<Leader>p', 'vip!par -w 100<CR>', { desc = 'Format paragraph' })
vim.keymap.set('n', '<Leader>P', 'ggVG!par -w 100<CR>', { desc = 'Format entire file with par' })
vim.keymap.set('n', 'Y', 'y$', { desc = 'Yank to end of line' })

-- File explorer and navigation
vim.keymap.set('n', '<Leader>n', ':NvimTreeToggle<CR>', { desc = 'Toggle file explorer' })
vim.keymap.set('n', '<C-b>', ':NvimTreeToggle<CR>', { desc = 'Toggle file explorer' })

-- Copy to system clipboard
vim.keymap.set('v', '<C-c>', '"+y', { desc = 'Copy to system clipboard' })

-- Smart paste - doesn't overwrite paste buffer when pasting over text
vim.keymap.set('v', 'p', '"_dP', { desc = 'Paste without overwriting buffer' })

-- Ctrl+P and Ctrl+N for fuzzy file finding (defined in telescope plugin config for lazy loading)

-- Plugin management
vim.keymap.set('n', '<Leader>l', ':Lazy<CR>', { desc = 'Open Lazy plugin manager' })

-- Quit shortcuts
vim.keymap.set('n', '<Leader>q', ':qa<CR>', { desc = 'Quit all' })
vim.keymap.set('n', '<Leader>w', ':q<CR>', { desc = 'Quit window' })
