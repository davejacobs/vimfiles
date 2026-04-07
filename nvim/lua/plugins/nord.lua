-- return {
--   "shaunsingh/nord.nvim",
--   name = "nord",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.g.nord_italic = true
--     vim.g.nord_bold = true
--     vim.cmd("colorscheme nord")
--
--     vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
--     vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
--     vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
--     vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'none' })
--     vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })
--
--     -- Treesitter @-prefixed capture groups (not defined by this Nord version)
--     vim.api.nvim_set_hl(0, '@type',         { fg = '#8FBCBB' }) -- nord7 teal
--     vim.api.nvim_set_hl(0, '@type.builtin', { fg = '#8FBCBB' })
--     vim.api.nvim_set_hl(0, '@constructor',  { fg = '#8FBCBB' })
--     vim.api.nvim_set_hl(0, '@module',       { fg = '#8FBCBB' })
--     vim.api.nvim_set_hl(0, '@function',     { fg = '#88C0D0' }) -- nord8 light blue
--     vim.api.nvim_set_hl(0, '@operator',     { fg = '#81A1C1' }) -- nord9 blue
--   end
-- }

return {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        require('nordic').load({
            transparent = { bg = true }
        })
    end
}
