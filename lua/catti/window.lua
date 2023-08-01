local M = {}
local catlang = require("catti.catlang")

local default_lines = {
    "Did you just move your MOUSE? Ridiculous. You make me sick.",
    " ",
    "This is strike one. Move along now. Quit this screen without your mouse.",
    "(use ':q' to exit.)"
}

local function align_text_center(text, width)
    local text_length = #text
    local padding = math.floor((width - text_length) / 2)
    return string.rep(" ", padding) .. text
end

local function align_text_left(text, padding)
    return string.rep(" ", padding) .. text
end

M.display_window = function(lines, is_cat_lang, side_padding, top_padding, alignment)
    lines = lines or default_lines
    is_cat_lang = is_cat_lang or true
    side_padding = side_padding or 2
    top_padding = top_padding or 2
    alignment = alignment or "left"

    local buf = vim.api.nvim_create_buf(false, true)

    vim.api.nvim_buf_set_option(buf, "buftype", "nofile")
    vim.api.nvim_buf_set_option(buf, "modifiable", true)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, {" "})

    local max_win_width = vim.api.nvim_win_get_width(0)
    local max_win_height = vim.api.nvim_win_get_height(0)
    local new_win_width = 100
    local aligned_line = ""

    for i, line in ipairs(lines) do

        if catlang then
            aligned_line = catlang.translate_to_catlang(line)
        end

        if alignment == "left" then
            aligned_line = align_text_left(aligned_line, side_padding)
        elseif alignment == "center" then
            aligned_line = align_text_center(aligned_line, new_win_width)
        end

        vim.api.nvim_buf_set_lines(buf, i, i + 1, false, { aligned_line })
    end

    vim.api.nvim_buf_set_option(buf, "modifiable", false)

    local new_win_height = #lines + top_padding
    local new_win_row_pos = (max_win_height - new_win_height)/2
    local new_win_col_pos = (max_win_width - new_win_width)/2

    local win = vim.api.nvim_open_win(buf, false, {
        relative = "editor",
        row = new_win_row_pos,
        col = new_win_col_pos,
        width = new_win_width,
        height = new_win_height,
        style = "minimal",
        border = "double",
        title = "Catti says:",
        title_pos = "left",
    })

    return buf, win
end

return M
