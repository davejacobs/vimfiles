return {
  "nvim-java/nvim-java",
  ft = "java",
  branch = "v4.0.0",
  config = function()
    local lsp_config = require('config.lsp')

    require('java').setup({
      jdk = {
        auto_install = false
      }
    })

    vim.lsp.config('jdtls', {
      on_attach = lsp_config.on_attach,
      capabilities = lsp_config.capabilities
    })

    vim.lsp.enable('jdtls')
  end
}
