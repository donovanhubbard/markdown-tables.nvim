local child = MiniTest.new_child_neovim()

local T = MiniTest.new_set({
  hooks = {
    pre_case = function()
      -- Restart child process with custom 'init.lua' script
      child.restart({ '-u', 'scripts/minimal_init.lua' })
      -- Load tested plugin
      child.lua([[M = require('markdown-tables')]])
    end,
    -- Stop once all test cases are finished
    post_once = child.stop,
  },
})

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

T['table-1'] = function()
  child.cmd("e tests/fixtures/table-1-wrong.md")
  child.type_keys('<shift>v', 'jjjj', ":FormatTable<CR>")
  local lines = child.api.nvim_buf_get_lines(0, 0, -1, true)
  local rightText = readFileSync('./tests/fixtures/table-1-right.md')
  local rightLines = splitStringOnNewlines(rightText)
  MiniTest.expect.equality(lines,rightLines)
end

T['table-2'] = function()
  child.cmd("e tests/fixtures/table-2-wrong.md")
  child.type_keys('<shift>v', 'jjjj', ":FormatTable<CR>")
  local lines = child.api.nvim_buf_get_lines(0, 0, -1, true)
  local rightText = readFileSync('./tests/fixtures/table-2-right.md')
  local rightLines = splitStringOnNewlines(rightText)
  MiniTest.expect.equality(lines,rightLines)
end

T['table-3'] = function()
  child.cmd("e tests/fixtures/table-3-wrong.md")
  child.type_keys('<shift>v', 'jjjj', ":FormatTable<CR>")
  local lines = child.api.nvim_buf_get_lines(0, 0, -1, true)
  local rightText = readFileSync('./tests/fixtures/table-3-right.md')
  local rightLines = splitStringOnNewlines(rightText)
  MiniTest.expect.equality(lines,rightLines)
end

return T
