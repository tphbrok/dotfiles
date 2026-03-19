local builtin = require("telescope.builtin")
local fb = require("telescope").extensions.file_browser

-- file navigation
vim.keymap.set("n", "<leader>f",        function() builtin.git_files({ show_untracked = true })                                                                end, { desc = "Git files" })
vim.keymap.set("n", "<leader>F",        function() builtin.find_files({ hidden = true, find_command = { "fd", "--type", "f", "--hidden", "--exclude", ".git" } }) end, { desc = "Find files" })
vim.keymap.set("n", "<leader>g",        "<cmd>LazyGit<cr>",                                                                                                        { desc = "LazyGit" })
vim.keymap.set("n", "<leader>e",        function() fb.file_browser()                                                                                          end, { desc = "Explorer (cwd)" })
vim.keymap.set("n", "<leader>E",        function() fb.file_browser({ path = "%:p:h" })                                                                        end, { desc = "Explorer (buffer dir)" })
vim.keymap.set("n", "<leader>b",        function() builtin.oldfiles({ only_cwd = true })                                                                      end, { desc = "Recent files" })

-- window splits
vim.keymap.set("n", "<leader>wv", "<cmd>vsplit<cr>",   { desc = "Vertical split" })

-- window navigation
vim.keymap.set("n", "<leader>w<Left>",  "<C-w>h", { desc = "Go left" })
vim.keymap.set("n", "<leader>w<Right>", "<C-w>l", { desc = "Go right" })
vim.keymap.set("n", "<leader>w<Up>",    "<C-w>k", { desc = "Go up" })
vim.keymap.set("n", "<leader>w<Down>",  "<C-w>j", { desc = "Go down" })

-- search
vim.keymap.set("n", "<leader>/", builtin.live_grep, { desc = "Live grep" })

-- open netrw
vim.keymap.set("n", "<leader>n", "<cmd>Explore<cr>", { desc = "Netrw" })

-- LSP (buffer-local, set on attach)
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp_keymaps", { clear = true }),
  callback = function(args)
    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = args.buf, desc = desc })
    end

    map("n", "gd",         vim.lsp.buf.definition,                                    "Go to definition")
    map("n", "gD",         vim.lsp.buf.declaration,                                   "Go to declaration")
    map("n", "gt",         vim.lsp.buf.type_definition,                               "Go to type definition")
    map("n", "<leader>ca", vim.lsp.buf.code_action,                                   "Code action")
    map("n", "<leader>cr", vim.lsp.buf.rename,                                        "Rename")
    map("n", "<leader>cd", vim.diagnostic.open_float,                                 "Show diagnostic")
    map("n", "[d",         vim.diagnostic.goto_prev,                                  "Previous diagnostic")
    map("n", "]d",         vim.diagnostic.goto_next,                                  "Next diagnostic")
    map("n", "[D",         function() vim.diagnostic.goto_prev({ wrap = false }) end, "First diagnostic")
    map("n", "]D",         function() vim.diagnostic.goto_next({ wrap = false }) end, "Last diagnostic")
    map("n", "<leader>D",  function() require("telescope.builtin").diagnostics() end, "All diagnostics")
    map("n", "<leader>d",  function() require("telescope.builtin").diagnostics({ bufnr = 0 }) end, "Buffer diagnostics")
  end,
})
