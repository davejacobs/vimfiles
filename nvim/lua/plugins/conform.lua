return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        markdown = { "prettier" },
        sh = { "shfmt" },
        bash = { "shfmt" },
        zsh = { "shfmt" },
        haskell = { "fourmolu" },
        ruby = { "rubocop" },
        python = { "ruff_format", "ruff_fix" },
        html = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        sass = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" }
      },

      formatters = {
        prettier = {
          args = function()
            local args = { "--stdin-filepath", "$FILENAME" }
            local config_files = {".prettierrc", ".prettierrc.json", ".prettierrc.js", "prettier.config.js"}
            for _, config in ipairs(config_files) do
              if vim.fn.filereadable(config) == 1 then
                table.insert(args, "--config")
                table.insert(args, vim.fn.fnamemodify(config, ":p"))
                break
              end
            end
            return args
          end
        },
        rubocop = {
          args = { "--auto-correct", "--format", "files", "--stdin", "$FILENAME" }
        },
        shfmt = {
          args = { "-i", "2" }
        }
      }
    })

    vim.api.nvim_create_user_command('Format', function(args)
      local range = nil
      if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
          start = { args.line1, 0 },
          ["end"] = { args.line2, end_line:len() },
        }
      end
      require("conform").format({ async = true, range = range })
    end, { range = true })

    vim.keymap.set({ "n", "v" }, "<Leader>i", function()
      require("conform").format({ async = true, lsp_fallback = true })
    end, { desc = "Format buffer or range (manual)" })
  end
}
