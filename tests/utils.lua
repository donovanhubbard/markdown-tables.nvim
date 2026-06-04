local function readFileSync(path)
  local uv = vim.uv
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

return {
  readFileSync = readFileSync,
  splitStringOnNewlines = splitStringOnNewlines,
}
