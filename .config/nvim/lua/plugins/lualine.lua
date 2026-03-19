vim.pack.add({ "https://github.com/nvim-lualine/lualine.nvim" })

vim.opt.showmode = false

require("lualine").setup({
  options = {
    theme = "nord",
    globalstatus = true,
    section_separators = { left = "\u{E0B0}", right = "\u{E0B2}" },
    component_separators = { left = "\u{E0B1}", right = "\u{E0B3}" },
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
