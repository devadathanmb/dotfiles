local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    vim.notify("Error setting up lualine")
    return
end

lualine.setup {
    options = {
        theme = "material"
    }
}
