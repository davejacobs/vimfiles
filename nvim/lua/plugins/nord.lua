return {
  "nordtheme/vim",
  name = "nord",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd("colorscheme nord")

    vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })
  end
}
