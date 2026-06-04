local stringUtils = require("markdown-tables.string-utils")

-- param string: a string representing a cell of the table
-- param left_spaces: how many spaces to add to the left
-- param right_spaces: how many spaces to add to the right
-- return: a tring with the desired amount of space padding on each side
local function padString(str, left_spaces, right_spaces)
    left_spaces = left_spaces or 0
    right_spaces = right_spaces or 0

    local left_padding = string.rep(" ", left_spaces)
    local right_padding = string.rep(" ", right_spaces)

    return left_padding .. str .. right_padding
end

-- param t: A 2 dimensional lua table of strings with each string representing a cell
-- param col: an int representing which column # to look at
local function getMaxWidth(array, col)
  local maxWidth = 0
  for _, v in pairs(array) do
    local cell = v[col]
    local trimmedCell = stringUtils.Trim(cell)
    if trimmedCell ~= nil then
      local size = trimmedCell:len()
      if trimmedCell:sub(1,1) ~= '-' then
        if size > maxWidth then
          maxWidth = size
        end
      end
    end
  end
  return maxWidth
end



local function formatColumn(array, col)
  local maxWidth = getMaxWidth(array, col)
  for _, v in pairs(array) do
    local cell = v[col]
    local trimmedCell = stringUtils.Trim(cell)
    if trimmedCell == nil then
      trimmedCell = ""
    end

    if trimmedCell:sub(1,1) == '-' then
      local border = ""
      for _=1,maxWidth,1 do
        border = border .. "-"
      end
      trimmedCell = border
    end

    local paddedCell = padString(trimmedCell,1,maxWidth-trimmedCell:len()+1)
    v[col]=paddedCell
  end
end

--
-- param t: A 2 dimensional lua table of strings with each string representing a cell
-- return: void
local function convertText(t)
  local numOfCol = #t[1]
  local borderLine = {}
  for i=1, numOfCol, 1 do
    table.insert(borderLine,"-")
  end

  table.insert(t, 2, borderLine)

  for i=1, numOfCol, 1 do
    formatColumn(t, i)
  end

  return t
end

-- Converts a 2d lua table of strings into a markdown table
-- param t: A 2 dimensional lua table of strings with each string representing a cell
-- returns: an array of strings
local function renderMarkdown(t)

  t = convertText(t)

  local content = {}

  for i=1, #t, 1 do
    local line = ""
    for j=1, #t[i], 1 do
      line = line.."|"..t[i][j]
    end
    line = line.."|"
    table.insert(content,line)
  end
  return content
end

return renderMarkdown
