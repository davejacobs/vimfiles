-- Neovim options

-- Filesystem and buffers functionality
vim.opt.autowriteall = true -- Save when focus is lost
vim.opt.autoread = true     -- Detect file changes from outside of Vim and reload
vim.opt.hidden = true       -- Allow unsaved changes in hidden buffers

-- General interface
vim.opt.number = true     -- Show line numbers
vim.opt.visualbell = true -- Use visual bell instead of beep
vim.opt.belloff = 'all'   -- Disable all bells
vim.opt.scrolloff = 3     -- How far away from the edge the cursor initiates scrolling
vim.opt.showmode = false  -- Do not show current mode (e.g., --INSERT MODE--)
vim.opt.laststatus = 2    -- Always show status line

-- Editing interface
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' } -- Better completion experience
vim.opt.clipboard = 'unnamed'                           -- Use system clipboard

-- Editing functionality
vim.opt.expandtab = true      -- Use soft tabs
vim.opt.tabstop = 2           -- Default width of soft tabs
vim.opt.autoindent = true     -- Auto indent
vim.opt.shiftwidth = 2        -- Width of autoindent
vim.opt.smartindent = false   -- Causes problems, esp. with reindenting hashes
vim.opt.smarttab = true       -- Use shiftwidth to tab at line beginning
vim.opt.wrap = false          -- Wrap text inside screen
vim.opt.linebreak = true      -- Wrap words, not characters
vim.opt.foldmethod = 'indent' -- Fold using indentation
vim.opt.foldlevelstart = 20   -- Do not fold by default
-- vim.opt.tildeop = true        -- Tilde is an operator (i.e., cannot be used with modifiers)

-- Search functionality
vim.opt.hlsearch = true   -- Highlight search results
vim.opt.incsearch = true  -- Incremental search
vim.opt.ignorecase = true -- Ignore search case
vim.opt.smartcase = true  -- ... unless uppercase letters are explicit

-- Navigation
-- vim.opt.autochdir = true -- Automatically change directory

-- Mouse support
vim.opt.mouse = 'a'  -- Enable mouse in all modes

-- Neovim-specific improvements
vim.opt.fillchars = { eob = ' ' } -- Remove tildes from blank lines
vim.opt.cmdheight = 0             -- Minimal command line

-- Auto-save on lost focus
vim.api.nvim_create_autocmd('FocusLost', {
  pattern = '*',
  command = 'silent! wall',
  desc = 'Save all files when focus is lost'
})

-- Open help in full window
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'help',
  command = 'only',
  desc = 'Open help'
})
