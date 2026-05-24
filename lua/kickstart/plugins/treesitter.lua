---@module 'lazy'
---@type LazySpec
return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    branch = 'master',
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter-intro`
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },

        highlight = {
          enable = true,
        },

        indent = {
          enable = true,
        },

        auto_install = true,
      }
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
