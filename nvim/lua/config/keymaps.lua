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

-- Insert a blank line below/above and stay in normal mode (doesn't touch registers)
vim.keymap.set('n', '<Leader>o', ':put _<CR>', { desc = 'Blank line below' })
vim.keymap.set('n', '<Leader>O', ':put! _<CR>', { desc = 'Blank line above' })

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

-- Copy to system clipboard
vim.keymap.set('v', '<C-c>', '"+y', { desc = 'Copy to system clipboard' })

-- Copy the cursor's location as "path:line:col" to the system clipboard.
-- This is the same shape ripgrep, grep -n --column, and gcc/clang print, so
-- other tools can jump straight to it. In visual mode we copy a range instead.
local function copy_location(range)
  -- '%:.' is the path relative to the current directory. Swap to '%:p' for an
  -- absolute path, or '%:t' for just the file name.
  local path = vim.fn.expand('%:.')
  local location
  if range then
    -- getpos('v') is the selection's other end; getpos('.') is the cursor.
    -- Each is {bufnum, line, col, off}. Order them so start comes first.
    local a = vim.fn.getpos('v')
    local b = vim.fn.getpos('.')
    if a[2] > b[2] or (a[2] == b[2] and a[3] > b[3]) then
      a, b = b, a
    end
    location = string.format('%s:%d:%d-%d:%d', path, a[2], a[3], b[2], b[3])
  else
    location = string.format('%s:%d:%d', path, vim.fn.line('.'), vim.fn.col('.'))
  end
  vim.fn.setreg('+', location)
  vim.notify('Copied ' .. location)
end

vim.keymap.set('n', '<Leader>cl', function() copy_location(false) end,
  { desc = 'Copy path:line:col' })
vim.keymap.set('x', '<Leader>cl', function() copy_location(true) end,
  { desc = 'Copy path:line:col range' })

-- Smart paste - doesn't overwrite paste buffer when pasting over text
vim.keymap.set('v', 'p', '"_dP', { desc = 'Paste without overwriting buffer' })

-- Ctrl+P and Ctrl+N for fuzzy file finding (defined in telescope plugin config for lazy loading)

-- Plugin management
vim.keymap.set('n', '<Leader>l', ':Lazy<CR>', { desc = 'Open Lazy plugin manager' })

-- Quit shortcuts
vim.keymap.set('n', '<Leader>q', ':qa<CR>', { desc = 'Quit all' })
vim.keymap.set('n', '<Leader>w', ':q<CR>', { desc = 'Quit window' })
