vim.pack.add({ "https://github.com/windwp/nvim-autopairs" })

require("nvim-autopairs").setup({
  check_ts = true,
  ts_config = {
    javascript = { "template_string" },
    typescript = { "template_string" },
  },
  disable_filetype = { "TelescopePrompt" },
})
