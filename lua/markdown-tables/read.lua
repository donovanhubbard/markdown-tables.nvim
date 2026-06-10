local stringUtils = require("markdown-tables.string-utils")

--- Creates a 2D table representation of the text table
--- @param delimiter string the character used to delimit the table
--- @param lines string[] table of lines of text
--- @return string[][] t two-dimensional array representing the table
local function build2DArrayDelimiter(delimiter,lines)
  local t = {}
  for i=1, #lines, 1 do
    local cells = {}
    local isBorder = false
    for cell in lines[i]:gmatch("[^"..delimiter.."]+") do
      cell = stringUtils.Trim(cell)
      -- ignore the line under the header in markdown tables
      if string.match(cell,'^-+$') ~= nil then
        isBorder = true
        break
      end
      table.insert(cells, cell)
    end
    if not isBorder then
      table.insert(t,cells)
    end
  end
  return t
end

--- @param lines string[] a 1 dimensional table of strings representing the rows of the table
--- @return string|nil char A single character that shows what delimits the table. Nil if it cannot be determined.
local function determineDelimiter(lines)
  local firstLine = lines[1] -- only look at first line

  -- if the first line contains '|' then markdown
  local _, count = string.gsub(firstLine, "|", "")
  if count > 0 then
    return '|'
  end

  -- if the first line contains \t then tsv
  _, count = string.gsub(firstLine, "\t", "")
  if count > 0 then
    return "\t"
  end

  -- if the first line contains ',' then csv
   _, count = string.gsub(firstLine, ",", "")
  if count > 0 then
    return ","
  end

  return nil
end


--- @param buffer number vim buffer number
--- @param args
--- @return string[][]|nil t A 2 dimensional lua table of strings with each string representing a cell
--          nil if it is not a table
local function readTable(buffer, args)
  local lines = vim.api.nvim_buf_get_lines(buffer,args.line1-1,args.line2, false)
  local delimiter = determineDelimiter(lines)

  if delimiter == nil then
    return nil
  end

  local array = build2DArrayDelimiter(delimiter,lines)
  return array
end

return readTable
