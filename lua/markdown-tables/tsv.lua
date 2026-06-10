--- @param t string[][]
--- @return string[] content
local function renderTSV(t)
  local content = {}

  for i=1, #t, 1 do
    local line = ""
    for j=1, #t[i], 1 do
      if j == #t[i] then
        line = line..t[i][j]
      else
        line = line..t[i][j].."\t"
      end
    end
    table.insert(content,line)
  end
  return content

end

return renderTSV
