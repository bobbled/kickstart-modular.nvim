---@module 'lazy'
---@type LazySpec
return {
  {
    'nickjvandyke/opencode.nvim',
    version = '*', -- latest stable release
    config = function()
      ---@type opencode.Opts
      vim.g.opencode_opts = {}

      vim.o.autoread = true -- required for buffer reload on edits

      -- Toggle opencode terminal
      vim.keymap.set({ 'n', 't' }, '<C-.>', function() require('opencode').toggle() end, { desc = 'Toggle opencode' })

      -- Ask with current context (operator / line shortcuts)
      vim.keymap.set({ 'n', 'x' }, 'go', function() return require('opencode').operator '@this ' end, { desc = 'Add range to opencode', expr = true })
      vim.keymap.set('n', 'goo', function() return require('opencode').operator '@this ' .. '_' end, { desc = 'Add line to opencode', expr = true })

      -- Prompt / select
      vim.keymap.set({ 'n', 'x' }, '<leader>oa', function() require('opencode').ask('@this: ', { submit = true }) end, { desc = '[O]pencode [A]sk' })
      vim.keymap.set({ 'n', 'x' }, '<leader>os', function() require('opencode').select() end, { desc = '[O]pencode [S]elect' })

      -- Scroll the opencode session
      vim.keymap.set('n', '<leader>ou', function() require('opencode').command 'session.half.page.up' end, { desc = '[O]pencode scroll [U]p' })
      vim.keymap.set('n', '<leader>od', function() require('opencode').command 'session.half.page.down' end, { desc = '[O]pencode scroll [D]own' })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
