return {
  cmd = { 'pyright-langserver', '--stdio' },
  filetypes = { 'python' },
  before_init = function(_, config)
    config.settings = config.settings or {}
    config.settings.python = config.settings.python or {}
    config.settings.python.pythonPath = config.root_dir .. '/.venv/bin/python'
  end
}
