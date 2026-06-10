--- Removes any whitespace at the start or end of the string
--- @param str string The string to trim
--- @return string trimmed the trimmed string
local function trim(str)
  return str:match("^%s*(.-)%s*$")
end

--- Prints the table to the screen
--- @param t string[][]
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
