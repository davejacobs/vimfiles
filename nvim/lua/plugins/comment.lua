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
    require('ts_context_commentstring').setup({
      enable_autocmd = false,
      languages = {
        json = '// %s',
        toml = '# %s'
      }
    })
    local ts_pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()
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
      -- Prefer the treesitter-aware commentstring (for embedded languages), but
      -- always fall back to the buffer's own commentstring. Returning a value here
      -- short-circuits Comment.nvim's built-in treesitter fallback, which crashes on
      -- Neovim 0.12 for any filetype lacking an installed parser (get_parser now
      -- returns nil instead of erroring, defeating the plugin's pcall guard). Even
      -- an empty string is truthy, so a filetype with no commentstring gets a clear
      -- "invalid commentstring" message rather than the opaque "[Comment.nvim] nil".
      pre_hook = function(ctx)
        return ts_pre_hook(ctx) or vim.bo.commentstring
      end
    })
  end
}
