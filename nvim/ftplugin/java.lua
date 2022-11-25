local status_ok, jdtls = pcall(require, "jdtls")
if not status_ok then
    vim.notify("jdtls not found")
    return
end

local config = {
    cmd = {'/home/devadathan/.local/share/nvim/mason/packages/jdtls/bin/jdtls'},
    on_attach = require("njan.lsp.handlers").on_attach,
    root_dir = vim.fs.dirname(vim.fs.find({'.gradlew', '.git', 'mvnw'}, { upward = true })[1]),
}

jdtls.start_or_attach(config)
