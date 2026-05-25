---@module 'lazy'
---@type LazySpec
return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    branch = 'main',
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    -- The new API (nvim-treesitter main / Neovim 0.12+) no longer uses
    -- nvim-treesitter.configs. Highlighting and indent are built into Neovim.
    -- setup() only accepts { install_dir = '...' } now.
    config = function()
      -- Install parsers on demand. Highlighting/indent are enabled by default
      -- in Neovim 0.12 via vim.treesitter; no explicit enable needed.
      require('nvim-treesitter').install({ 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
