return {
  "Olical/conjure",
  ft = { "clojure", "fennel" },
  init = function()
    -- Conjure otherwise steals K for its own doc lookup, clobbering the LSP
    -- hover mapping set on LspAttach. Keep K as hover; use <localleader>k for docs.
    vim.g["conjure#mapping#doc_word"] = "k"
    -- Don't auto-open the REPL log window on every eval; toggle it explicitly.
    vim.g["conjure#log#hud#enabled"] = true
    vim.g["conjure#log#hud#anchor"] = "SE"
  end
}
