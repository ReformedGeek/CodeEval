--[[
Challenge description: https://www.codeeval.com/open_challenges/1/

Solution description:
Generalized FizzBuzz generator with optimized routine for cases where one
divisor is an even divisor of the other or where the divisors are equal.
--]]

--[[
In the case that one divisor equals one, we can optimize FizzBuzz by only
checking one divisor for even divisibility. In the case that both are equal
to 1, no checks are necessary apart from a bounds checks to prevent trailing
spaces per the exercise instructions.

While these are technically different edge cases, they are similar enough to
justify putting this secondary check into one_fizzbuzz() rather than having a
second check and additional subroutine.
--]]

local function one_fizzbuzz(x, y, limit)
  if x == 1 then
    if y == 1 then
      for i=1, limit do
        io.write("FB")
        if i == limit then
          return
    		end
    		io.write(" ")
    	end
    else
      for i = 1, limit do
        if i % y == 0 then
          io.write("FB")
        else
          io.write("F")
        end
        if i == limit then
          return
        end
        io.write(" ")
      end
    end
  else
    for i=1, limit do
      if i % x == 0 then
        io.write("FB")
      else
        io.write("B")
      end
      if i == limit then
        return
      end
      io.write(" ")
    end
  end
end


--[[
If x or y is a divisor of the other, we can optimize our FizzBuzz routine by
doing less checks for divisibility, since we can guarantee that the smaller
of the two divisors will always be an even divisor of i if the larger divisor
is an even divisor of i.
--]]

local function simplified_fizzbuzz(x, y, limit)
  for i=1,limit do
    if x > y then
      if i % x == 0 then
        io.write("FB")
      elseif i % y == 0 then
        io.write("B")
      else io.write(tostring(i))
      end
    else
      if i % y == 0 then
        io.write("FB")
      elseif i % x == 0 then
        io.write("F")
      else io.write(tostring(i))
      end
    end
    
    if i == limit then
      return
    end
    io.write(" ")
  end
end

--[[
If x and y are equal, we can optimize our FizzBuzz routine by doing only one
check for divisibility.
--]]
  
local function equal_fizzbuzz(x, limit)
  for i=1,limit do
    if i % x == 0 then
      io.write("FB")
    else io.write(tostring(i))
    end
    if i == limit then
      return
    end
    io.write(" ")
  end
end  
  

-- Generalized form of FizzBuzz
local function generalized_fizzbuzz(x, y, limit)
  for i=1,limit do
    if i % x == 0 then
      if i % y == 0 then
        io.write("FB")
      else
        io.write("F")
      end
    elseif i % y == 0 then
      io.write("B")
    else
      io.write(tostring(i))
    end
    if i == limit then
      return
    end
    io.write(" ")
  end
end


-- Main routine
local lines = {}
local file = assert(io.open(arg[1], "r"))
for line in file:lines() do
  local nums = {}
    for num in line:gmatch("%d+") do
       nums[#nums + 1] = tonumber(num)
    end
    lines[#lines + 1] = nums
end


for n, line in ipairs(lines) do
  local x, y, limit = line[1], line[2], line[3]
  if x == 1 or y == 1 then
    one_fizzbuzz(x, y, limit)
  elseif x ~= y and (x % y == 0 or y % x == 0) then
    simplified_fizzbuzz(x, y, limit)
  elseif x == y then
    equal_fizzbuzz(x, limit)
  else   
    generalized_fizzbuzz(x, y, limit)
  end
  if n ~= #lines then
    io.write("\n")
  end
end