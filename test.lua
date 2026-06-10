local result = string.match('foo','^-+$')
print(result)
result = string.match('------','^-+$')
print(result)
result = string.match('foo-foo','^-+$')
print(result)
local cell = 'foo-foo'
if string.match(cell,'^-+$') ~= nil then
  print("This is a border")
end
cell = "----"
if string.match(cell,'^-+$') ~= nil then
  print("This is a border")
end
