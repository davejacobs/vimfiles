return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup({
      ensure_installed = { "haskell", "javascript", "markdown", "markdown_inline", "ruby" },
      highlight = { enable = true }
    })
  end
}
