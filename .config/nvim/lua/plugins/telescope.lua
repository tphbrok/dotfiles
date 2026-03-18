vim.pack.add({
  { src = "https://github.com/nvim-lua/plenary.nvim",                       event = "VeryLazy" },
  { src = "https://github.com/nvim-telescope/telescope.nvim",               event = "VeryLazy" },
  { src = "https://github.com/nvim-telescope/telescope-file-browser.nvim",  event = "VeryLazy" },
})

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  once = true,
  callback = function()
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
        file_ignore_patterns = { "^%.git/" },
      },
      extensions = {
        file_browser = {
          hidden = { file_browser = true, folder_browser = true },
          respect_gitignore = false,
          git_status = false,
          filter_func = function(path, _)
            return not path:match("/.git$") and not path:match("/.git/")
          end,
        },
      },
    })
    require("telescope").load_extension("file_browser")
    require("telescope").load_extension("lazygit")
  end,
})
