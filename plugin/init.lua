
if vim.g.loaded_markdown_tables == 1 then
  return
end
vim.g.loaded_markdown_tables = 1

M = require('markdown-tables')

vim.api.nvim_create_user_command('FormatTable',function(args)
  M.FormatTable(args)
end,{range = 2})

