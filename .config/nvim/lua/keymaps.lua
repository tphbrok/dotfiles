local builtin = require("telescope.builtin")
local fb = require("telescope").extensions.file_browser

vim.keymap.set("n", "<leader>f",        function() builtin.git_files({ show_untracked = true })                                                                end, { desc = "Git files" })
vim.keymap.set("n", "<leader>F",        function() builtin.find_files({ hidden = true, find_command = { "fd", "--type", "f", "--hidden", "--exclude", ".git" } }) end, { desc = "Find files" })
vim.keymap.set("n", "<leader>g",        "<cmd>LazyGit<cr>",                                                                                                        { desc = "LazyGit" })
vim.keymap.set("n", "<leader>e",        function() fb.file_browser()                                                                                          end, { desc = "Explorer (cwd)" })
vim.keymap.set("n", "<leader>E",        function() fb.file_browser({ path = "%:p:h" })                                                                        end, { desc = "Explorer (buffer dir)" })
vim.keymap.set("n", "<leader>b",        function() builtin.oldfiles({ only_cwd = true })                                                                      end, { desc = "Recent files" })
