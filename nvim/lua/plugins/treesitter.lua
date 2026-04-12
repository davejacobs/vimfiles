return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  config = function()
    -- TSInstall clears and reloads the parsers module, so we re-register soar
    -- on TSUpdate (which fires after every reload) as well as at startup.
    local function register_soar()
      require("nvim-treesitter.parsers").soar = {
        install_info = {
          path = vim.fn.stdpath("config") .. "/vendor/soar-treesitter",
          files = { "src/parser.c" },
        },
        filetype = "soar",
      }
    end
    register_soar()
    vim.api.nvim_create_autocmd("User", { pattern = "TSUpdate", callback = register_soar })

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
      "soar",
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
        "soar",
        "typescript",
        "yaml"
      },
      callback = function() vim.treesitter.start() end
    })
  end
}
