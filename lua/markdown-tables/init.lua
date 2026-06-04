local renderMarkdown = require("markdown-tables.markdown")
local renderCSV = require("markdown-tables.csv")
local renderTSV = require("markdown-tables.tsv")
local readTable = require("markdown-tables.read")


local function createMarkdownTable(args)
   local buffer = vim.api.nvim_get_current_buf()
   local t = readTable(buffer,args)

   if t == nil then
     return
   end

   local content = renderMarkdown(t)
   vim.api.nvim_buf_set_lines(buffer,args.line1-1,args.line2,false,content)
end

local function createCSVTable(args)
   local buffer = vim.api.nvim_get_current_buf()
   local t = readTable(buffer,args)

   if t == nil then
     return
   end

   local content = renderCSV(t)
   vim.api.nvim_buf_set_lines(buffer,args.line1-1,args.line2,false,content)
end

local function createTSVTable(args)
   local buffer = vim.api.nvim_get_current_buf()
   local t = readTable(buffer,args)

   if t == nil then
     return
   end

   local content = renderTSV(t)
   vim.api.nvim_buf_set_lines(buffer,args.line1-1,args.line2,false,content)
end

local M = {
  CreateMarkdownTable = createMarkdownTable,
  CreateCSVTable = createCSVTable,
  CreateTSVTable = createTSVTable,
}

return M

