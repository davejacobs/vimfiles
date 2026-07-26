# Usage

This guide covers some of the highlights of this configuration.

## Plugin management

### Lazy.nvim

- `<Leader>l` - Open Lazy plugin manager
- `:Lazy` - Open Lazy plugin manager

**Within Lazy interface:**

- `U` - Update all plugins
- `S` - Sync (clean + update)
- `C` - Check for updates
- `X` - Clean plugins that are no longer needed
- `I` - Install missing plugins
- `L` - Show log
- `P` - Profile plugin loading times
- `?` - Show help with all keybindings
- `q` - Close Lazy

## Important keybindings

### Leaders

- **Leader key**: `,` (comma)
- **Local leader**: `;` (semicolon)

### Settings

- `<Leader>cv` - Edit init.lua
- `<Leader>cg` - Edit gvimrc
- `<Leader>cb` - Edit plugins.vim
- `<Leader>cp` - Edit plugins-config.vim
- `<Leader>h` - Edit filetype-specific file

### Basic editing

- `kj` - Exit insert mode
- `<Leader>=` - Format entire file with conform.nvim (uses configured formatters)
- `<Leader>i` - Format buffer or visual selection (async with LSP fallback)
- `=` - Format with motion (e.g., `gg=G` for entire file, `=ap` for paragraph)
- `Y` - Yank to end of line, mirroring the built-in behavior of D and C
- `p` - Paste is modified not to overwrite the buffer in visual mode
- `<S-CR>` - New line below in insert mode
- `:w!!` - Save current buffer with sudo

### Window management

- `<Leader>s` - Horizontal split
- `<Leader>v` - Vertical split
- `<C-h/j/k/l>` - Navigate between windows
- `<Leader>q` - Quit all
- `<Leader>w` - Quit window

## File exploration and navigation

### nvim-tree

- `<Leader>n` - Toggle file explorer

### Telescope

- `<C-p>` and `<C-n>` - Find files
- `<Leader>ff` - Find files
- `<Leader>fg` - Live grep (search in files)
- `<Leader>fb` - Find buffers
- `<Leader>fh` - Find help tags
- `<Leader>fo` - Find recent files
- `<Leader>fc` - Find git commits
- `<Leader>fs` - Find git status
- `<Leader>fw` - Find word under cursor

## Search and replace

### grug-far (project-wide find/replace)

- `<Leader>fr` - Open find and replace (in visual mode, prefills the search with the selection)
- `<Leader>fp` - Find and replace scoped to the current file

**Within the grug-far buffer:**

Fill in the Search and Replace fields to preview matches live across the project. The Files Filter, Flags, and Paths fields scope the search using ripgrep globs (e.g. `*.lua`) and flags (e.g. `--fixed-strings`). The keys below use the local leader (`;`):

- `;r` - Replace all matches
- `;s` - Sync all changes back to the files
- `;l` - Sync the current line only
- `;x` - Open the match under the cursor in a buffer
- `;o` / `;t` - Open location / toggle preview
- `q` or `;c` - Close the buffer

### Clearing search

- `<Leader>y` - Clear search highlights
- `<C-y>` - Clear search highlights

## Text editing and formatting

### Comment.nvim

- `gc` - Toggle comment (normal/visual mode)
- `gcc` - Toggle comment on current line
- `gbc` - Toggle block comment
- `gcO` - Comment above current line
- `gco` - Comment below current line
- `gcA` - Comment at end of line
- `<Leader>/` - Toggle comment on current line or selection
- `<C-/>` - Toggle comment on current line or selection (same as `<Leader>/`)

### nvim-surround

- `ys{motion}{char}` - Add surround (e.g., `ysiw"` to surround word with quotes)
- `yss{char}` - Surround entire line
- `ds{char}` - Delete surround (e.g., `ds"` to remove quotes)
- `cs{old}{new}` - Change surround (e.g., `cs"'` to change quotes to apostrophes)
- `S{char}` - Surround selection in visual mode

**Convenient aliases:**

- `a` = angle brackets `<>`
- `b` = parentheses `()`
- `B` = braces `{}`
- `r` = square brackets `[]`
- `q` = any quote (`"`, `'`, `` ` ``)
- `s` = any surround character

## Writing and focus

### Text formatting

- `<Leader>i` - Format document using mdformat
- `<Leader>p` - Format current paragraph with par
- `<Leader>P` - Format entire file with par

### zen-mode (distraction-free writing)

- `<Leader>z` - Toggle zen mode for focused writing

## LSP (Language Server Protocol)

### Navigation

- `gd` - Go to definition
- `gD` - Go to declaration
- `gr` - Show references
- `gi` - Go to implementation
- `K` - Show hover documentation
- `<C-k>` - Show signature help

### Code actions and refactoring

- `<Leader>ca` - Code actions (quick fixes, imports, refactorings)
- `<Leader>rn` - Rename symbol

### Diagnostics

- `[d` - Go to previous diagnostic
- `]d` - Go to next diagnostic
- `<Leader>d` - Open diagnostic float (show error details)

### Diagnosing LSP state

When a server won't attach or misbehaves, work from quickest check to deepest:

- `:checkhealth vim.lsp` - Health check showing attached clients, root dirs, configured
  commands, and common misconfigurations. First stop.
- `:LspInfo` - Clients attached to the current buffer (on Neovim 0.11+ this aliases
  `:checkhealth vim.lsp`).
- `:lua =vim.lsp.get_clients()` - All active clients, pretty-printed (`=` is shorthand for
  `print(vim.inspect(...))`).
- `:lua =vim.lsp.get_clients({ bufnr = 0 })` - Clients on the current buffer only; index into
  the result for `.root_dir` or `.server_capabilities`.
- `:lua vim.cmd('edit ' .. vim.lsp.get_log_path())` - Open the LSP log to see spawn errors,
  crashes, and malformed responses.
- `:lua vim.lsp.set_log_level("debug")` - Bump log verbosity while reproducing an issue.

For the diagnostics themselves rather than the client:

- `:lua =vim.diagnostic.get(0)` - Diagnostics in the current buffer.
- `:lua =vim.diagnostic.config()` - How diagnostics are displayed.

Typical workflow: `:checkhealth vim.lsp` to confirm the client attached; if not, check the log
for spawn or root-dir errors; if attached but misbehaving, inspect `server_capabilities` and set
the log level to `debug`.

### Java-specific

- `<Leader>oi` - Organize imports (automatically add missing imports and remove unused ones)
- `<Leader>ca` - Import missing class when cursor is on unresolved symbol

### Completion (nvim-cmp)

- `<C-Space>` - Trigger completion
- `<CR>` - Confirm selection
- `<Tab>` / `<S-Tab>` - Navigate completion items
- `<C-e>` - Close completion menu
- `<C-b>` / `<C-f>` - Scroll documentation

**Note**: Completion is disabled in Markdown files

## Code navigation

### aerial.nvim (symbol outline)

- `<Leader>a` - Toggle symbol outline
- `<Leader>ds` - Search symbols with Telescope

**Within aerial window:**

- `<CR>` - Jump to symbol
- `<C-v>` - Jump to symbol in vertical split
- `<C-s>` - Jump to symbol in horizontal split
- `o` / `za` - Toggle tree fold
- `O` / `zA` - Toggle tree fold recursively
- `l` / `zo` - Open tree node
- `L` / `zO` - Open tree node recursively
- `h` / `zc` - Close tree node
- `H` / `zC` - Close tree node recursively
- `zr` - Increase fold level
- `zR` - Open all folds
- `zm` - Decrease fold level
- `zM` - Close all folds
- `q` - Close window
- `{` / `}` - Previous/next symbol
- `[[` / `]]` - Previous/next symbol (up tree)
- `?` / `g?` - Show help

### Tags and Git

- `<Leader>t` - Generate ctags

### Neogit (Git integration)

**Basic commands:**

- `<C-G>` - Open Neogit interface
- `:Neogit` - Open Neogit interface

**Within Neogit interface:**

- `s` - Stage file/hunk under cursor
- `u` - Unstage file/hunk under cursor
- `x` - Discard changes under cursor
- `=` - Toggle diff
- `<Tab>` - Toggle fold
- `<CR>` - Open file or expand section
- `c` - Open commit menu
  - `c` - Create commit
  - `a` - Amend commit
  - `e` - Extend commit
  - `w` - Reword commit
- `p` - Open push menu
- `P` - Open pull menu
- `Z` - Open stash menu
- `b` - Open branch menu
- `l` - Open log menu
- `r` - Open rebase menu
- `?` - Show help with all commands
- `q` - Close Neogit
- `<C-c>` - Close Neogit

**Diff navigation:**

- `]c` - Next hunk
- `[c` - Previous hunk

### undotree (undo history)

- `:UndotreeToggle` - Toggle undo tree visualization

## Linting and formatting

### Manual controls

- `<Leader>l` - Run linter on current file
- `:Lint` - Run linter command
- `<Leader>i` / `<C-i>` - Format current buffer or selection (manual only)
- `<Leader>=` - Format entire file
- `=` - Format with motion (e.g., `gg=G`, `=ap`)
- `:Format` - Format command

### Formatters by language

- **Markdown**: mdformat with wrap width from textwidth (default 100)
- **JavaScript/TypeScript**: prettier
- **Python**: ruff_format, ruff_fix
- **Ruby**: rubocop
- **Shell**: shfmt
- **Haskell**: fourmolu
- **HTML/CSS/SCSS/SASS**: prettier
- **JSON/YAML**: prettier

Make sure the right formatter is installed:

```bash
# Formatters
npm install -g prettier
pip install mdformat ruff
gem install rubocop
brew install shfmt
cabal install fourmolu

# Linters
npm install -g eslint jsonlint markdownlint-cli
pip install mypy
brew install stylua luarocks shellcheck
luarocks install luacheck
```

## Adding support for a new language

Full support for a language requires changes in up to three places:

**1. LSP server** — for code intelligence (go-to-definition, hover docs, diagnostics, etc.)

Install the server binary (see README for examples), create
`nvim/lsp/<server_name>.lua` returning a config table:

```lua
return {
  cmd = { 'my-language-server', '--stdio' },
  filetypes = { 'mylang' }
}
```

Then add `'<server_name>'` to the `vim.lsp.enable({...})` call in
`nvim/lua/config/lsp.lua`.

**2. Treesitter parser** — for syntax highlighting and for Comment.nvim to
resolve comment strings (without this, `,/` will fail with a nil error)

Add the parser name to the install list and the filetype to the `FileType`
autocmd pattern in `nvim/lua/plugins/treesitter.lua`. The parser name (e.g.
`bash`) and the Neovim filetype (e.g. `sh`) are sometimes different — check
`:h ft` or `:set ft?` in a buffer of that type if unsure. Restart Neovim to
trigger the install.

**3. Formatter/linter** (optional) — see the "Formatters by language" section
above. Add entries to `nvim/lua/plugins/conform.lua` and/or
`nvim/lua/plugins/nvim-lint.lua`.

## Tips

1. **Plugin management**: Use `<Leader>l` or `:Lazy` to manage plugins (install, update, clean)
2. **Plugin help**: Use `:help <plugin-name>` for detailed documentation
3. **Key mapping help**: Use `:nmap <key>` to see what a key is mapped to
4. **LSP info**: Use `:LspInfo` to check language server status
5. **Telescope commands**: Use `:Telescope` to see all available pickers
6. **Zen mode**: Perfect for distraction-free writing and reading
