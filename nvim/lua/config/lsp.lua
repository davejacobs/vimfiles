vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local opts = { buffer = args.buf }
    vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', '<C-]>', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<Leader>d', vim.diagnostic.open_float, opts)

    -- Shift+click / Cmd+click to go to definition
    vim.keymap.set('n', '<S-LeftMouse>', '<LeftMouse><Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.keymap.set('n', '<D-LeftMouse>', '<LeftMouse><Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  end
})

-- Shift+hover underline (like VSCode Ctrl+hover)
vim.opt.mousemoveevent = true
vim.api.nvim_set_hl(0, 'LspHoverUnderline', { underline = true, sp = 'white' })
local hover_ul_ns = vim.api.nvim_create_namespace('lsp_hover_underline')
local hover_ul_buf = nil

local function clear_hover_underline()
  if hover_ul_buf and vim.api.nvim_buf_is_valid(hover_ul_buf) then
    vim.api.nvim_buf_clear_namespace(hover_ul_buf, hover_ul_ns, 0, -1)
  end
  hover_ul_buf = nil
end

local function underline_word_at_mouse()
  local mpos = vim.fn.getmousepos()
  if mpos.winid == 0 then return end
  local buf = vim.api.nvim_win_get_buf(mpos.winid)
  local row = mpos.line - 1
  local col = mpos.column - 1
  local line = vim.api.nvim_buf_get_lines(buf, row, row + 1, false)[1]
  if not line then return end
  col = math.min(col, #line - 1)
  if col < 0 then return end
  local before = line:sub(1, col + 1):match('[%w_]+$') or ''
  local after = line:sub(col + 2):match('^[%w_]+') or ''
  clear_hover_underline()
  if #before + #after == 0 then return end
  local word_start = col + 1 - #before
  local word_end = math.min(word_start + #before + #after, #line)
  vim.api.nvim_buf_set_extmark(buf, hover_ul_ns, row, word_start, {
    end_col = word_end,
    hl_group = 'LspHoverUnderline',
    hl_mode = 'combine',
    priority = 200
  })
  hover_ul_buf = buf
end

vim.keymap.set('n', '<S-MouseMove>', function()
  underline_word_at_mouse()
  return '<Ignore>'
end, { expr = true })

vim.keymap.set('n', '<MouseMove>', function()
  clear_hover_underline()
  return '<Ignore>'
end, { expr = true })

vim.lsp.enable({
  'lua_ls',
  'hls',
  'purescriptls',
  'clojure_lsp',
  'ruby_lsp',
  'ts_ls',
  'pyright',
  'html',
  'cssls',
  'jsonls',
  'marksman',
  'clangd'
})

local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
vim.diagnostic.config({
  virtual_text = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = signs.Error,
      [vim.diagnostic.severity.WARN] = signs.Warn,
      [vim.diagnostic.severity.HINT] = signs.Hint,
      [vim.diagnostic.severity.INFO] = signs.Info
    }
  },
  underline = true,
  update_in_insert = false,
  severity_sort = false
})
