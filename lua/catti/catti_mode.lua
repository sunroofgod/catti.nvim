local M = {}

local toggled
local catti_mode_buf
local catti_mode_buf_handle

local mouse = require("catti.mouse")
local messages = require("catti.cm_messages")

local function create_catti_mode_buffer()
    catti_mode_buf = vim.api.nvim_create_buf(true, false)
    vim.api.nvim_buf_set_name(catti_mode_buf, "CattiMode")
    catti_mode_buf_handle = vim.fn.bufnr("CattiMode")
    vim.api.nvim_buf_set_option(catti_mode_buf_handle, "filetype", "catti_mode")
end

local function delete_catti_mode_buffer()
    catti_mode_buf_handle = vim.fn.bufnr("CattiMode")
    vim.api.nvim_buf_delete(catti_mode_buf_handle, { force = true })
end

function M.catti_mode_toggle()
    catti_mode_buf_handle = vim.fn.bufnr("CattiMode")

    if vim.api.nvim_buf_is_loaded(catti_mode_buf_handle) then
        toggled = vim.api.nvim_buf_get_var(catti_mode_buf_handle, "toggled")
        if toggled then
            vim.api.nvim_buf_set_var(catti_mode_buf_handle, "toggled", false)
            mouse.stop_mouse_tracker()
        else
            vim.api.nvim_buf_set_var(catti_mode_buf_handle, "toggled", true)
            vim.api.nvim_buf_set_var(catti_mode_buf_handle, "count", 0)
            mouse.start_mouse_tracker(messages.get_display_message)
        end
    else
        create_catti_mode_buffer()
        catti_mode_buf_handle = vim.fn.bufnr("CattiMode")
        vim.api.nvim_buf_set_var(catti_mode_buf_handle, "toggled", true)
        vim.api.nvim_buf_set_var(catti_mode_buf_handle, "count", 0)
        mouse.start_mouse_tracker(messages.get_display_message)
    end
end

return M
