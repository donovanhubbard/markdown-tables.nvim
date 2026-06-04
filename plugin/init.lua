
if vim.g.loaded_markdown_tables == 1 then
  return
end
vim.g.loaded_markdown_tables = 1

M = require('markdown-tables')

vim.api.nvim_create_user_command('CreateMarkdownTable',function(args)
  M.CreateMarkdownTable(args)
end,{range = 2})

vim.api.nvim_create_user_command('CreateCSVTable',function(args)
  M.CreateCSVTable(args)
end,{range = 2})

vim.api.nvim_create_user_command('CreateTSVTable',function(args)
  M.CreateTSVTable(args)
end,{range = 2})


