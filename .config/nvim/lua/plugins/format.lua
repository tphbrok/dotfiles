vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("format_on_save", { clear = true }),
  pattern = { "*.ts", "*.tsx", "*.js", "*.jsx", "*.json", "*.html", "*.lua" },
  callback = function()
    vim.lsp.buf.format({ async = false, silent = true })
  end,
})
