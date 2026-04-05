local bufnr = vim.api.nvim_get_current_buf()

vim.keymap.set('n', 'K', function()
  vim.cmd.RustLsp { 'hover', 'actions' }
end, { silent = true, buffer = bufnr, desc = 'Rust hover actions' })

vim.keymap.set('n', '<leader>rr', function()
  vim.cmd.RustLsp 'runnables'
end, { silent = true, buffer = bufnr, desc = 'Rust runnables' })

vim.keymap.set('n', '<leader>rt', function()
  vim.cmd.RustLsp 'testables'
end, { silent = true, buffer = bufnr, desc = 'Rust testables' })
