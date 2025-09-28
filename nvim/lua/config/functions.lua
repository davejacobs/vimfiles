-- Utility functions (converted from functions.vim)

local M = {}

-- Get filetype-specific file path
M.filetype_file = function()
  return vim.fn.expand("~/.vim/ftplugin/") .. vim.bo.filetype .. ".vim"
end

-- Copy current file path with line number to clipboard
M.copy_path_with_line = function()
  local path_with_line = vim.fn.expand("%") .. ":" .. vim.fn.line(".")
  print("Copied: " .. path_with_line)
  vim.fn.setreg("*", path_with_line)
end

-- Strip trailing whitespace while preserving cursor position
M.strip_trailing_whitespace = function()
  local save_cursor = vim.fn.getpos(".")
  vim.cmd([[%s/\s\+$//e]])
  vim.fn.setpos('.', save_cursor)
end

vim.api.nvim_create_user_command('CopyPathWithLine', M.copy_path_with_line, { desc = 'Copy file path with line number' })
vim.api.nvim_create_user_command('StripWhitespace', M.strip_trailing_whitespace, { desc = 'Strip trailing whitespace' })

return M
