return {
  "julienvincent/nvim-paredit",
  ft = { "clojure", "fennel", "scheme", "lisp", "janet" },
  config = function()
    require("nvim-paredit").setup({
      -- Keep the cursor on the form when slurping/barfing so repeated presses
      -- stay anchored rather than chasing the moving delimiter.
      cursor_behaviour = "auto",
      indent = {
        enabled = true
      },
      keys = {
        [">)"] = { require("nvim-paredit").api.slurp_forwards, "Slurp forwards" },
        ["<)"] = { require("nvim-paredit").api.barf_forwards, "Barf forwards" },
        [">("] = { require("nvim-paredit").api.slurp_backwards, "Slurp backwards" },
        ["<("] = { require("nvim-paredit").api.barf_backwards, "Barf backwards" },
        ["<localleader>o"] = { require("nvim-paredit").api.raise_form, "Raise form" },
        ["<localleader>O"] = { require("nvim-paredit").api.raise_element, "Raise element" }
      }
    })
  end
}
