-- This is the colorscheme name
local colorscheme = "material"

-- Material style
vim.g.material_style = "darker"


-- Protected call to load colorscheme
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

