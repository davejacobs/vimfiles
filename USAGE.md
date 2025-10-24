# Usage

This guide covers the modern plugins and keybindings in this Neovim configuration.

## Core keybindings

### Leaders

- **Leader key**: `,` (comma)
- **Local leader**: `;` (semicolon)

### Basic editing

- `kj` - Exit insert mode
- `<Leader>=` - Format entire file with conform.nvim (uses configured formatters)
- `<Leader>i` - Format buffer or visual selection (async with LSP fallback)
- `<C-i>` - Format buffer or visual selection (same as `<Leader>i`)
- `=` - Format with motion (e.g., `gg=G` for entire file, `=ap` for paragraph)
- `<S-CR>` - New line below in insert mode
- `Y` - Yank to end of line
- `<C-c>` - Copy selection to system clipboard (visual mode)
- `p` - Paste without overwriting buffer (visual mode)
- `w!!` - Save with sudo (command mode)

### Window management

- `<Leader>s` - Horizontal split
- `<Leader>v` - Vertical split
- `<C-h/j/k/l>` - Navigate between windows (works in insert, normal, visual modes)
- `<Leader>q` - Quit all
- `<Leader>w` - Quit window

## File exploration and navigation

### nvim-tree

- `<Leader>n` - Toggle file explorer
- `<C-b>` - Toggle file explorer
- `<D-n>` - Toggle file explorer (MacVim)

**Within nvim-tree:**

- `C` - Change root to selected node
- `u` - Change root to parent directory
- `<CR>` - Open file
- `v` - Open in vertical split

### Telescope (fuzzy finding)

- `<C-p>` - Find files
- `<C-n>` - Find files
- `<Leader>ff` - Find files
- `<Leader>fg` - Live grep (search in files)
- `<Leader>fb` - Find buffers
- `<Leader>fh` - Find help tags
- `<Leader>fr` - Find recent files
- `<Leader>fc` - Find git commits
- `<Leader>fs` - Find git status
- `<Leader>fw` - Find word under cursor

## Search and replace

### nvim-spectre (advanced find/replace)

- `<Leader>S` - Open Spectre panel
- `<Leader>sw` - Search word under cursor (also works in visual mode)
- `<Leader>sp` - Search in current file

**Within Spectre:**

- `<CR>` - Go to file/line
- `dd` - Toggle current item
- `<Leader>R` - Replace all
- `<Leader>rc` - Replace current line
- `<Leader>q` - Send to quickfix
- `<Leader>o` - Show options
- `ti` - Toggle ignore case
- `th` - Toggle hidden files

### Basic search

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

### Text formatting

- `<Leader>p` - Format current paragraph with par
- `<Leader>P` - Format entire file with par
- `<D-p>` - Format paragraph (MacVim)

## Writing and focus

### zen-mode (distraction-free writing)

- `<Leader>z` - Toggle zen mode for focused writing

### Markdown tools

- Automatic list continuation
- Enhanced syntax highlighting
- Table formatting support

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

## File and project management

### Quick config access

- `<Leader>cv` - Edit init.lua
- `<Leader>cg` - Edit gvimrc
- `<Leader>cb` - Edit plugins.vim
- `<Leader>cp` - Edit plugins-config.vim
- `<Leader>h` - Edit filetype-specific file

## Code navigation

### undotree (undo history)

- `:UndotreeToggle` - Toggle undo tree visualization

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

### Auto-features

- Trailing whitespace automatically stripped on save for: js, rb, py, scss, md
- **No auto-formatting** - use `<Leader>i` for manual formatting only
- Auto-linting with nvim-lint for active file types (JavaScript, TypeScript, Ruby, Shell scripts)

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

## Tips

2. **Plugin management**: Use `<Leader>l` or `:Lazy` to manage plugins (install, update, clean)
1. **Plugin help**: Use `:help <plugin-name>` for detailed documentation
1. **Key mapping help**: Use `:nmap <key>` to see what a key is mapped to
1. **LSP info**: Use `:LspInfo` to check language server status
1. **Mason**: Use `:Mason` to manage language servers, linters, and formatters
1. **Telescope commands**: Use `:Telescope` to see all available pickers
1. **Zen mode**: Perfect for distraction-free writing and reading

## Modern features

- **Lazy loading**: Plugins load only when needed for faster startup
- **LSP integration**: Modern language server support with nvim 0.11+ APIs
- **Async linting/formatting**: Non-blocking code quality tools
- **Fuzzy finding**: Powerful file and content search with Telescope
- **Tree-sitter**: Advanced syntax highlighting and code understanding
