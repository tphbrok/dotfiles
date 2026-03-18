vim.pack.add({
  "https://github.com/nvim-treesitter/nvim-treesitter",
})

require("nvim-treesitter.install").compilers = { "clang" }

require("nvim-treesitter").install(
  { "typescript", "javascript", "json", "html", "css", "angular" },
  { summary = false }
):wait(30000)

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("treesitter", { clear = true }),
  pattern = { "typescript", "javascript", "json", "html", "css", "angular" },
  callback = function(args)
    vim.treesitter.start(args.buf)
  end,
})
