--[[
Challenge description: https://www.codeeval.com/open_challenges/29/

Solution description:
Quick and dirty implementation; build a set from each line's numbers, then
iterate through each line's numbers to build a string from elements that
haven't already been added, then print that string, one for each line in the
file.

To-do:
Implement with sorted inner tables built from the elements of the sets.
--]]


-- Main Routine
local lines = {}
local file = assert(io.open(arg[1], "r"))

for line in file:lines() do
  local nums = {}
  for num in line:gmatch("%d+") do
    nums[#nums + 1] = tonumber(num)
  end
  lines[#lines + 1] = nums
end

local sets = {}

-- Emulate an integer indexed array of sets
for i, line in ipairs(lines) do
  sets[i] = {}
  for _, j in ipairs(line) do sets[i][j] = true end
end


for i, line in ipairs(lines) do
  local to_print = ''
  for _, j in ipairs(line) do
    if sets[i][j] then
      to_print = to_print .. tostring(j)
      sets[i][j] = nil
      if next(sets[i]) ~= nil then
        to_print = to_print .. ','
      end
    end
  end
  print(to_print)
end
      