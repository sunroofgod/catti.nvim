local mouse_actions = { "Left", "Right", "Middle", "Press", "Drag", "Release", "WheelUp", "WheelDown" }

local M = {}

local function mousey()
    print("mouse detected")
end

function M.start_mouse_tracker(func_on_mouse_detection)
    func_on_mouse_detection = func_on_mouse_detection or mousey
    for _, action in ipairs(mouse_actions) do
        local map_expr = "<" .. action .. "Mouse>"
        vim.keymap.set({"n", "t", "v"}, map_expr, func_on_mouse_detection)
    end
end

function M.stop_mouse_tracker()
    for _, action in ipairs(mouse_actions) do
        local map_expr = "<" .. action .. "Mouse>"
        vim.keymap.del({"n", "t", "v"} , map_expr)
    end
end

return M
