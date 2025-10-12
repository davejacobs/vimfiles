return {
  "numToStr/Comment.nvim",
  event = "VeryLazy",
  config = function()
    require('Comment').setup({
      padding = true,
      sticky = true,
      ignore = nil,
      toggler = {
        line = 'gcc',
        block = 'gbc'
      },
      opleader = {
        line = 'gc',
        block = 'gb'
      },
      extra = {
        above = 'gcO',
        below = 'gco',
        eol = 'gcA'
      },
      mappings = {
        basic = true,
        extra = true,
      }
    })

    local api = require('Comment.api')
    vim.keymap.set('n', '<Leader>/', api.toggle.linewise.current, { desc = 'Comment toggle current line' })
    vim.keymap.set('v', '<Leader>/', '<ESC><cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', { desc = 'Comment toggle linewise (visual)' })
  end
}
