local function padString(str, left_spaces, right_spaces)
    left_spaces = left_spaces or 0
    right_spaces = right_spaces or 0

    local left_padding = string.rep(" ", left_spaces)
    local right_padding = string.rep(" ", right_spaces)

    return left_padding .. str .. right_padding
end

local function build2DArray(lines)
  local array = {}
  for i=1, #lines, 1 do
    local cells = {}
    for cell in lines[i]:gmatch("[^|]+") do
      table.insert(cells, cell)
    end
    table.insert(array,cells)
  end
  return array
end

local function renderTable(array)
  local content = {}

  for i=1, #array, 1 do
    local line = ""
    for j=1, #array[i], 1 do
      line = line.."|"..array[i][j]
    end
    line = line.."|"
    table.insert(content,line)
  end
  return content
end

local function getMaxWidth(array, col)
  local maxWidth = 0
  for _, v in pairs(array) do
    local cell = v[col]
    local trimmedCell = cell:gsub("%s+","")
    local size = trimmedCell:len()

    if trimmedCell:sub(1,1) ~= '-' then
      if size > maxWidth then
        maxWidth = size
      end
    end
  end
  return maxWidth
end

local function formatColumn(array, col)
  local maxWidth = getMaxWidth(array, col)
  for _, v in pairs(array) do
    local cell = v[col]
    local trimmedCell = cell:gsub("%s+","")

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


local M = {
  _formatRange = function(content)
    local array = build2DArray(content)

    local numOfCol = #array[1]

    for i=1, numOfCol, 1 do
      formatColumn(array, i)
    end

    return renderTable(array)
  end,
  FormatTable = function(args)
    local buffer = vim.api.nvim_get_current_buf()
    local lines = vim.api.nvim_buf_get_lines(buffer,args.line1-1,args.line2, false)
    local content =  M._formatRange(lines)

    vim.api.nvim_buf_set_lines(buffer,args.line1-1,args.line2,false,content)
  end,
}

return M

