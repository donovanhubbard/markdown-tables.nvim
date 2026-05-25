local M = {}

M.check = function()
  vim.health.start("Checking commands")
  if vim.fn.exists(":FormatTable") == 2 then
    vim.health.ok("Has :FormatTable command")
  else
    vim.health.error("Missing :FormatTable command")
  end
end

return M
