-- Colorscheme plugins

return {
  {
    "nordtheme/vim",
    name = "nord",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme nord")

      -- This removes the background, allowing for transparency if enabled in the terminal
      -- To find the names of other highlight groups, see the following: 
      -- https://neovim.io/doc/user/syntax.html#highlight-groups
      vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })
    end,
  },
}
