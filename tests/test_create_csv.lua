local child = MiniTest.new_child_neovim()
local utils = require("tests.utils")

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

T['tsv'] = function()
  child.cmd("e tests/fixtures/tsv-table-1.md")
  child.type_keys('<shift>v', 'jjj', ":CreateCSVTable<CR>")
  local lines = child.api.nvim_buf_get_lines(0, 0, -1, true)
  local rightText = utils.readFileSync('./tests/fixtures/csv-table-1.md')
  local rightLines = utils.splitStringOnNewlines(rightText)
  MiniTest.expect.equality(lines,rightLines)
end

T['csv'] = function()
  child.cmd("e tests/fixtures/csv-table-1.md")
  child.type_keys('<shift>v', 'jjj', ":CreateCSVTable<CR>")
  local lines = child.api.nvim_buf_get_lines(0, 0, -1, true)
  local rightText = utils.readFileSync('./tests/fixtures/csv-table-1.md')
  local rightLines = utils.splitStringOnNewlines(rightText)
  MiniTest.expect.equality(lines,rightLines)
end

T['md'] = function()
  child.cmd("e tests/fixtures/markdown-table-1.md")
  child.type_keys('<shift>v', 'jjjj', ":CreateCSVTable<CR>")
  local lines = child.api.nvim_buf_get_lines(0, 0, -1, true)
  local rightText = utils.readFileSync('./tests/fixtures/csv-table-1.md')
  local rightLines = utils.splitStringOnNewlines(rightText)
  MiniTest.expect.equality(lines,rightLines)
end

T['md-malformatted'] = function()
  child.cmd("e tests/fixtures/markdown-table-1-malformatted.md")
  child.type_keys('<shift>v', 'jjjj', ":CreateCSVTable<CR>")
  local lines = child.api.nvim_buf_get_lines(0, 0, -1, true)
  local rightText = utils.readFileSync('./tests/fixtures/csv-table-1.md')
  local rightLines = utils.splitStringOnNewlines(rightText)
  MiniTest.expect.equality(lines,rightLines)
end

return T
