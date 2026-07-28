return {
  'AlexvZyl/nordic.nvim',
  enabled = false,
  lazy = false,
  priority = 1000,
  config = function()
    require('nordic').load({
      transparent = { bg = vim.env.NVIM_GUI ~= '1' }
    })
  end
}
