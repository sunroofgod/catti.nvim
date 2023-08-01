local M = {}

function M.func_wrap(func, ...)
    local args = {...}
    return function()
        func(unpack(args))
    end
end

return M
