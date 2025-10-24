return {
  "numToStr/Comment.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<Leader>/",
      function()
        require('Comment.api').toggle.linewise.current()
      end,
      mode = "n",
      desc = "Comment toggle current line"
    },
    {
      "<Leader>/",
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      mode = "v",
      desc = "Comment toggle linewise (visual)"
    },
    {
      "<C-/>",
      function()
        require('Comment.api').toggle.linewise.current()
      end,
      mode = "n",
      desc = "Comment toggle current line"
    },
    {
      "<C-/>",
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      mode = "v",
      desc = "Comment toggle linewise (visual)"
    }
  },
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
  end
}
