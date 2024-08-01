local uv = vim.uv
local formatRange = require('markdown-tables')._formatRange
local function readFileSync(path)
  local fd = assert(uv.fs_open(path, "r", 438))
  local stat = assert(uv.fs_fstat(fd))
  local data = assert(uv.fs_read(fd, stat.size, 0))
  assert(uv.fs_close(fd))
  return data
end

local function splitStringOnNewlines(str)
    local result = {}
    for line in str:gmatch("([^\n]*)\n?") do
      if line ~= "" then
        table.insert(result, line)
      end
    end
    return result
end

describe("some basics", function()

  it("should succeed with table 1", function()
    local wrongText = readFileSync('./tests/fixtures/table-1-wrong.md')
    local wrongLines = splitStringOnNewlines(wrongText)
    local result = formatRange(wrongLines)
    local rightText = readFileSync('./tests/fixtures/table-1-right.md')
    local rightLines = splitStringOnNewlines(rightText)
    assert.are.same(rightLines,result)
  end)
  it("should succeed with table 2", function()
    local wrongText = readFileSync('./tests/fixtures/table-2-wrong.md')
    local wrongLines = splitStringOnNewlines(wrongText)
    local result = formatRange(wrongLines)
    local rightText = readFileSync('./tests/fixtures/table-2-right.md')
    local rightLines = splitStringOnNewlines(rightText)
    assert.are.same(rightLines,result)
  end)

end)
