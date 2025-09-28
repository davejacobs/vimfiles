-- Utility functions for Neovim

local function reload_config()
  -- Clear all Lua module cache
  for name, _ in pairs(package.loaded) do
    if name:match('^config') then
      package.loaded[name] = nil
    end
  end

  dofile(vim.env.MYVIMRC or vim.fn.stdpath('config') .. '/init.lua')

  vim.notify("Config reloaded", vim.log.levels.INFO)
end

vim.api.nvim_create_user_command('ReloadConfig', reload_config, {})
vim.keymap.set('n', '<Leader>R', reload_config, { desc = 'Reload Neovim config' })

return {
  reload_config = reload_config,
}
