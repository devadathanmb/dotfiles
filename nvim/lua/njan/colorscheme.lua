-- This is the colorscheme name
local colorscheme = "tokyonight-storm"


-- Protected call to load colorscheme
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

