# Usage

This guide covers the modern plugins and keybindings in this Neovim configuration.

## Core keybindings

### Leaders

- **Leader key**: `,` (comma)
- **Local leader**: `;` (semicolon)

### Basic editing

- `kj` - Exit insert mode
- `<Leader>=` - Format entire file and return to original position
- `<S-CR>` - New line below in insert mode
- `Y` - Yank to end of line
- `<C-c>` - Copy selection to system clipboard (visual mode)

### Window management

- `<Leader>s` - Horizontal split
- `<Leader>v` - Vertical split
- `<C-h/j/k/l>` - Navigate between windows (works in insert, normal, visual modes)

## File exploration and navigation

### nvim-tree

- `<Leader>n` - Toggle file explorer
- `<D-n>` - Toggle file explorer (MacVim)

**Within nvim-tree:**

- `C` - Change root to selected node
- `u` - Change root to parent directory
- `<CR>` - Open file
- `v` - Open in vertical split

### Telescope (fuzzy finding)

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

## Text editing and formatting

### Comment.nvim

- `gc` - Toggle comment (normal/visual mode)
- `gcc` - Toggle comment on current line
- `gbc` - Toggle block comment
- `<Leader>/` - Toggle comment on current line or selection

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

### Diagnostics and navigation

- `gd` - Go to definition
- `gD` - Go to declaration
- `gr` - Go to references
- `gi` - Go to implementation
- `K` - Show hover documentation
- `<C-k>` - Show signature help (insert mode)

### Code actions

- `<Leader>ca` - Code actions
- `<Leader>rn` - Rename symbol
- `[d` / `]d` - Navigate diagnostics

### Completion (nvim-cmp)

- `<C-Space>` - Trigger completion
- `<C-y>` - Confirm selection
- `<C-e>` - Close completion menu
- `<C-u>` / `<C-d>` - Scroll documentation

## File and project management

### Quick config access

- `<Leader>cv` - Edit init.lua
- `<Leader>cg` - Edit gvimrc
- `<Leader>cb` - Edit plugins.vim
- `<Leader>cp` - Edit plugins-config.vim
- `<Leader>h` - Edit filetype-specific file

## Code navigation

### aerial.nvim (symbol outline)

- `<Leader>a` - Toggle symbol outline
- `<Leader>ds` - Search symbols with Telescope

**Within aerial window:**

- `<CR>` - Jump to symbol
- `o` - Toggle tree fold
- `q` - Close window
- `{` / `}` - Previous/next symbol
- `h` / `l` - Close/open tree nodes

### Tags and Git

- `<Leader>t` - Generate ctags
- `<D-B>` - Browse current selection/line on GitHub (vim-fugitive)

## Linting and formatting

### Manual controls

- `<Leader>l` - Run linter on current file
- `:Lint` - Run linter command
- `<Leader>i` - Format current buffer or selection (manual only)
- `:Format` - Format command

Make sure the right linter is installed:

    npm install -g eslint prettier
    pip install ruff mypy
    gem install rubocop
    brew install stylua luarocks
    luarocks install luacheck
    brew install shellcheck shfmt
    npm install -g jsonlint markdownlint-cli

### Auto-features

- Trailing whitespace automatically stripped on save for: js, rb, py, scss, md
- **No auto-formatting** - use `<Leader>i` for manual formatting only
- Auto-linting with nvim-lint for active file types (JavaScript, TypeScript, Ruby, Shell scripts)

## Tips

2. **Plugin management**: Use `:Lazy` to manage plugins (install, update, clean)
3. **Plugin help**: Use `:help <plugin-name>` for detailed documentation
4. **Key mapping help**: Use `:nmap <key>` to see what a key is mapped to
5. **LSP info**: Use `:LspInfo` to check language server status
6. **Mason**: Use `:Mason` to manage language servers, linters, and formatters
7. **Telescope commands**: Use `:Telescope` to see all available pickers
8. **Zen mode**: Perfect for distraction-free writing and reading

## Modern features

- **Lazy loading**: Plugins load only when needed for faster startup
- **LSP integration**: Modern language server support with nvim 0.11+ APIs
- **Async linting/formatting**: Non-blocking code quality tools
- **Fuzzy finding**: Powerful file and content search with Telescope
- **Tree-sitter**: Advanced syntax highlighting and code understanding
