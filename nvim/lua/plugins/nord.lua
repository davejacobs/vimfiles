return {
  "shaunsingh/nord.nvim",
  name = "nord",
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.nord_italic = true
    vim.g.nord_bold = true
    vim.cmd("colorscheme nord")

    vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })
  end
}
