return {
  "numToStr/Comment.nvim",
  dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
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
    require('ts_context_commentstring').setup({ enable_autocmd = false })
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
      },
      pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()
    })
  end
}
