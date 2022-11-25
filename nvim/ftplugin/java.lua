local status_ok, jdtls = pcall(require, "jdtls")
if not status_ok then
    vim.notify("jdtls not found")
    return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
  return
end
capabilities.textDocument.completion.completionItem.snippetSupport = false
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

local config = {
    cmd = {'/home/devadathan/.local/share/nvim/mason/packages/jdtls/bin/jdtls'},
    on_attach = require("njan.lsp.handlers").on_attach,
    root_dir = vim.fs.dirname(vim.fs.find({'.gradlew', '.git', 'mvnw'}, { upward = true })[1]),
    format = {
        enabled = false,
    }
}

jdtls.start_or_attach(config)
