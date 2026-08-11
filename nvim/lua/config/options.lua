-- Neovim options

-- Filesystem and buffers functionality
vim.opt.autowriteall = false -- Auto-save is handled safely on FocusLost (see below)
vim.opt.autoread = true      -- Detect file changes from outside of Vim and reload
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

-- GUI font
if vim.env.NVIM_GUI == '1' then
  vim.opt.guifont = "Hack_Nerd_Font_Mono:h14"
end

-- Auto-save on lost focus, but never clobber a file that an external process
-- (e.g. an agent editing on disk) changed since we last read or wrote it.
local function remember_disk_mtime(buf)
  local name = vim.api.nvim_buf_get_name(buf)
  if name ~= '' then
    vim.b[buf].disk_mtime = vim.fn.getftime(name)
  end
end

-- Track the on-disk timestamp whenever a buffer is in sync with disk. This is
-- the baseline the FocusLost save compares against to detect external edits.
vim.api.nvim_create_autocmd({ 'BufReadPost', 'BufWritePost' }, {
  pattern = '*',
  callback = function(args) remember_disk_mtime(args.buf) end,
  desc = 'Record on-disk mtime while buffer matches disk'
})

-- Seed the baseline for buffers already loaded when this config runs.
for _, buf in ipairs(vim.api.nvim_list_bufs()) do
  if vim.api.nvim_buf_is_loaded(buf) then remember_disk_mtime(buf) end
end

local function save_unconflicted_buffers()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    local name = vim.api.nvim_buf_get_name(buf)
    local savable = vim.api.nvim_buf_is_loaded(buf)
      and vim.bo[buf].modified
      and vim.bo[buf].buftype == ''
      and vim.bo[buf].modifiable
      and not vim.bo[buf].readonly
      and name ~= ''
    if savable then
      -- getftime is seconds-resolution; a strict > means an unchanged file
      -- (mtime == baseline) still saves, while any later disk write blocks us.
      if vim.fn.getftime(name) > (vim.b[buf].disk_mtime or 0) then
        vim.notify(
          ('Not auto-saving %s: it changed on disk since you opened it'):format(name),
          vim.log.levels.WARN
        )
      else
        vim.api.nvim_buf_call(buf, function() vim.cmd('silent keepalt update') end)
      end
    end
  end
end

vim.api.nvim_create_autocmd('FocusLost', {
  pattern = '*',
  callback = save_unconflicted_buffers,
  desc = 'Auto-save on focus loss without clobbering external changes'
})

-- Open help in full window
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'help',
  command = 'only',
  desc = 'Open help'
})
