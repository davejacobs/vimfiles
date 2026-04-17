return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  ft = { "markdown" },
  config = function()
    require("render-markdown").setup({ indent = { enabled = false } })
    local function set_hl()
      vim.api.nvim_set_hl(0, "RenderMarkdownCode", { bg = "NONE" })
    end
    set_hl()
    vim.api.nvim_create_autocmd("ColorScheme", { callback = set_hl })
  end
}
