return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "mason.nvim",
    "mason-lspconfig.nvim"
  },
  config = function()
    require("config.lsp")
  end
}
