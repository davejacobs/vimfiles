return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  config = function()
    require("nvim-treesitter").install { "bash", "clojure", "haskell", "javascript", "markdown", "markdown_inline", "python", "ruby", "typescript" }
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "bash", "clojure", "haskell", "javascript", "markdown", "python", "ruby", "sh", "typescript" },
      callback = function() vim.treesitter.start() end
    })
  end
}
