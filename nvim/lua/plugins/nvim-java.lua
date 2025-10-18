return {
  "nvim-java/nvim-java",
  dependencies = {
    "neovim/nvim-lspconfig"
  },
  ft = "java",
  config = function()
    local lsp_config = require('config.lsp')

    require('java').setup({
      jdk = {
        auto_install = false
      }
    })

    require('lspconfig').jdtls.setup({
      on_attach = lsp_config.on_attach,
      capabilities = lsp_config.capabilities
    })
  end
}
