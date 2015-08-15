--[[
Challenge description: https://www.codeeval.com/open_challenges/22/

solution description:
Calculate nth Fibonacci number. Since we only care about the result and don't
need to do anything with the other numbers in the sequence, we use recursion,
which is stack safe as Lua implements proper tail calls.
--]]

function nth_fib (n, fib_sub_n, fib_sub_n_minus_one)
    if n == 1 then
        return fib_sub_n
    end
    local n = n - 1
    local next_fib = fib_sub_n + fib_sub_n_minus_one
    return nth_fib(n, next_fib, fib_sub_n)
end

local lines = {}
local file = assert(io.open(arg[1], "r"))
for line in file:lines() do lines[#lines + 1] = tonumber(line) end
for i = 1, #lines do
    if lines[i] == 0 then
        print("0")
    else print(nth_fib(lines[i], 1, 0)) 
    end
end
