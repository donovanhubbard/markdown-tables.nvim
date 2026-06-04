
-- param str: a string
-- returns: the same string without any whitespace on the front or end
local function trim(str)
  if str == nil then
    return nil
  end
  return str:match("^%s*(.-)%s*$")
end

local function printTable(t)
  for i=1, #t, 1 do
    for j=1, #t[i], 1 do
      io.write(t[i][j]..",")
    end
  end
end

return {
  Trim = trim,
  PrintTable = printTable,
}
