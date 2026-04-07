return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  config = function()
    require("nvim-treesitter").install {
      "bash",
      "c",
      "clojure",
      "cpp",
      "css",
      "haskell",
      "html",
      "java",
      "javascript",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "ruby",
      "typescript",
      "yaml"
    }
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "bash",
        "c",
        "clojure",
        "cpp",
        "css",
        "haskell",
        "html",
        "java",
        "javascript",
        "lua",
        "markdown",
        "python",
        "ruby",
        "sh",
        "typescript",
        "yaml"
      },
      callback = function() vim.treesitter.start() end
    })
  end
}
