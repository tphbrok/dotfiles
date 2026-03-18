vim.lsp.config("vtsls", {
  cmd = { "vtsls", "--stdio" },
  filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
  root_markers = { "tsconfig.json", "package.json" },
  settings = {
    vtsls = {
      autoUseWorkspaceTsdk = true,
      experimental = {
        completion = { enableServerSideFuzzyMatch = true },
      },
    },
    typescript = {
      updateImportsOnFileMove = { enabled = "always" },
      suggest = { completeFunctionCalls = true },
    },
    javascript = {
      updateImportsOnFileMove = { enabled = "always" },
      suggest = { completeFunctionCalls = true },
    },
  },
})

vim.lsp.config("jsonls", {
  cmd = { "vscode-json-language-server", "--stdio" },
  filetypes = { "json", "jsonc" },
  root_markers = { "package.json" },
})

local node_modules = vim.fn.getcwd() .. "/node_modules"
vim.lsp.config("angularls", {
  cmd = { "ngserver", "--stdio", "--tsProbeLocations", node_modules, "--ngProbeLocations", node_modules },
  filetypes = { "html", "htmlangular" },
  root_markers = { "angular.json", "nx.json" },
  on_attach = function(client)
    client.server_capabilities.renameProvider = false
  end,
})

vim.lsp.enable({ "vtsls", "jsonls", "angularls" })
