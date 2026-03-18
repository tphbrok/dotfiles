vim.pack.add({ "https://github.com/nvim-lualine/lualine.nvim" })

vim.opt.showmode = false

require("lualine").setup({
  options = {
    theme = "nord",
    globalstatus = true,
    section_separators = "",
    component_separators = "│",
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = { { "filename", path = 1 } },
    lualine_x = { "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
})
