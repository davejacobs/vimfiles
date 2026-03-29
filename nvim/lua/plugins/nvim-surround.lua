return {
  "kylechui/nvim-surround",
  version = "*",
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup({
      surrounds = {},
      aliases = {
        ["a"] = ">",
        ["b"] = ")",
        ["B"] = "}",
        ["r"] = "]",
        ["q"] = { '"', "'", "`" },
        ["s"] = { "}", "]", ")", ">", '"', "'", "`" }
      },
      highlight = {
        duration = 0,
      },
      move_cursor = "begin",
      indent_lines = function(start, stop)
        local b = vim.bo
        if start < stop and (b.equalprg ~= "" or b.indentexpr ~= "" or b.cindent or b.smartindent or b.lisp) then
          vim.cmd(string.format("silent normal! %dG=%dG", start, stop))
        end
      end
    })
  end
}
