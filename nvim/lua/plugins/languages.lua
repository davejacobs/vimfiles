-- Language-specific plugins

return {
  { "neovimhaskell/haskell-vim", ft = "haskell" },
  { "vim-ruby/vim-ruby", branch = "master", ft = "ruby" },
  { "nelstrom/vim-textobj-rubyblock", dependencies = { "kana/vim-textobj-user" }, ft = "ruby" },
  { "pangloss/vim-javascript", ft = "javascript" },
  { "NoahTheDuke/vim-just", ft = "just" },
  { "nvim-java/nvim-java", ft = "java" }
}
