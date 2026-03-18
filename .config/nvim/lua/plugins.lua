vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-telescope/telescope.nvim",
  "https://github.com/nvim-telescope/telescope-file-browser.nvim",
  "https://github.com/kdheepak/lazygit.nvim",
  "https://github.com/gbprod/nord.nvim",
})

require("nord").setup({})
vim.cmd.colorscheme("nord")

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
require("telescope").load_extension("file_browser")
require("telescope").load_extension("lazygit")
