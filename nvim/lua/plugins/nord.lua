return {
  'AlexvZyl/nordic.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('nordic').load({
      transparent = { bg = vim.env.MACNEOVIM ~= '1' }
    })
  end
}
