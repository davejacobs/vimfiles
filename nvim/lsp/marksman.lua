return {
  cmd = { 'marksman', 'server' },
  filetypes = { 'markdown' },
  flags = {
    debounce_text_changes = 150
  },
  on_exit = function(code, signal, client_id)
    if code == 143 then
      vim.notify("Marksman LSP restarting after crash", vim.log.levels.WARN)
      vim.schedule(function()
        vim.cmd('LspRestart marksman')
      end)
    end
  end
}
