
-- Converts a 2d lua table of strings into a csv table
-- param t: A 2 dimensional lua table of strings with each string representing a cell
-- returns: an array of strings
local function renderCSV(t)
  local content = {}

  for i=1, #t, 1 do
    local line = ""
    for j=1, #t[i], 1 do
      if j == #t[i] then
        line = line..t[i][j]
      else
        line = line..t[i][j]..","
      end
    end
    table.insert(content,line)
  end
  return content
end

return renderCSV
