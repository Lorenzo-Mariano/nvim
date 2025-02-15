local highlight = {
  "RainbowPink",
  "RainbowYellow",
  "RainbowBlue",
  "RainbowRed",
}

local hooks = require "ibl.hooks"

hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  vim.api.nvim_set_hl(0, "RainbowPink", { fg = "#FF79C6" }) -- Pink
  vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" }) -- Yellow
  vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" }) -- Blue
  vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" }) -- Red
end)

return {
  indent = { highlight = highlight },
}
