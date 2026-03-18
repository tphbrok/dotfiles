vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-telescope/telescope.nvim",
  "https://github.com/nvim-telescope/telescope-file-browser.nvim",
})

require("telescope").setup({
  defaults = {
    layout_strategy = "flex",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_cutoff = 120,
      },
    },
    sorting_strategy = "ascending",
  },
  extensions = {
    file_browser = {
      hidden = { file_browser = true, folder_browser = true },
      respect_gitignore = false,
      fd_opts = { "--exclude", ".git" },
    },
  },
})
