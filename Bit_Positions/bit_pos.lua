--[[
Challenge description:
https://www.codeeval.com/open_challenges/19/

Solution description:
Because CodeEval only permits Lua 5.1.4, we can not use the bit32 library,
which ships standard with Lua 5.2+. This code will work in Lua 5.2 and has
been tested in such. You can submit your own text file in the format of the
CodeEval challenge or use the included one, bit_pos.txt
--]]

local lines = {}
local file = assert(io.open(arg[1], "r"))
for line in file:lines() do
    local nums = {}
    for num in line:gmatch("%d+") do
       nums[#nums + 1] = tonumber(num)
    end
    lines[#lines + 1] = nums
end

for _, line in ipairs(lines) do
    local num, b1, b2 = line[1], line[2] - 1, line[3] - 1
    if bit32.rshift(num, b1) % 2 == bit32.rshift(num, b2) % 2 then
        print("true")
    else print("false")
    end
end
