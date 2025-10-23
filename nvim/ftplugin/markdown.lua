-- Markdown filetype-specific configuration

local WRAP_WIDTH = 100

-- Spell checking
vim.opt_local.spell = true
vim.opt_local.spelllang = 'en_us'
vim.opt_local.spellcapcheck = '' -- Turn off capitalization checking (doesn't work well after "vs." etc.)

-- Indentation settings
vim.opt_local.smartindent = false
vim.opt_local.cinoptions = '' -- Turn off programmer indentation
vim.opt_local.cindent = false -- Turn off C-style autoindenting
vim.opt_local.smarttab = false -- Don't use shiftwidth to tab at line beginning
vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4

-- Interface
vim.opt_local.number = false

-- Visual padding
vim.opt_local.signcolumn = 'yes:1'

-- Soft wrap
vim.opt_local.textwidth = WRAP_WIDTH
vim.opt_local.wrap = true
vim.opt_local.linebreak = true

-- Formatting
vim.opt_local.equalprg = 'mdformat --wrap ' .. WRAP_WIDTH .. ' -'

-- Move up and down using apparent lines, not real ones (for wrapped text)
vim.keymap.set('n', 'j', 'gj', { buffer = true })
vim.keymap.set('n', 'k', 'gk', { buffer = true })
vim.keymap.set('v', 'j', 'gj', { buffer = true })
vim.keymap.set('v', 'k', 'gk', { buffer = true })