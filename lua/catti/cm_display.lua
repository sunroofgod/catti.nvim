local M = {}

local window = require("catti.window")
local messages = require("catti.cm_messages")

function M.get_display_message()
    local table = messages
    local catti_mode_buf_handle = vim.fn.bufnr("CattiMode")
    local count = vim.api.nvim_buf_get_var(catti_mode_buf_handle, "count")
    count = count + 1
    if count == 3 then
        vim.api.nvim_command(":w")
        vim.api.nvim_command(":qa!")
    end
    vim.api.nvim_buf_set_var(catti_mode_buf_handle, "count", count)
    window.display_window(table[count])
end

return M
