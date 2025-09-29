-- Network and web-related plugins

return {
  {
    "mattn/webapi-vim",
    lazy = true,
  },
  {
    "mattn/gist-vim",
    dependencies = { "mattn/webapi-vim" },
    cmd = { "Gist" },
  }
}
