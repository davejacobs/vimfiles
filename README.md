# Vimfiles

My Neovim configuration.

## Prerequisites

- Curl
- Git
- Neovim 0.12+ (for Vim support, check out the `vim` branch)
- tree-sitter CLI 0.26.1+ (`brew install tree-sitter-cli`)
- "Nerd font" variant of the font you're using in the terminal

### LSP servers

Install the language servers for the languages you use:

    brew install lua-language-server          # Lua
    brew install haskell-language-server      # Haskell
    gem install ruby-lsp                      # Ruby
    npm install -g typescript-language-server typescript  # TypeScript/JavaScript
    npm install -g pyright                    # Python
    npm install -g vscode-langservers-extracted  # HTML, CSS, JSON
    npm install -g yaml-language-server       # YAML
    brew install clojure-lsp/brew/clojure-lsp-native  # Clojure
    brew install marksman                     # Markdown
    brew install llvm                         # C/C++ (provides clangd)

## Install

    git clone https://github.com/davejacobs/vimfiles.git
    cd vimfiles
    bin/install

## Usage

See [USAGE](/USAGE.md) for more information.
