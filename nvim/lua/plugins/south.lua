return {
  'arnauKL/south.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('south').setup({
      transparent = vim.env.NVIM_GUI ~= '1'
    })
    vim.cmd.colorscheme('south')
  end
}
