local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

require "njan.lsp.mason"
require("njan.lsp.handlers").setup()
require "njan.lsp.null-ls"

