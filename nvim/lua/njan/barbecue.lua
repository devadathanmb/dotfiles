local status_ok, barbecue = pcall(require, "barbecue")
if not status_ok then
    vim.notify("Barbecue not installed or error loading barbecue")
    return
end

  barbecue.setup()
