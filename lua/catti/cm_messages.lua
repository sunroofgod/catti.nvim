local M = {}

local window = require("catti.window")

local default_table = {
    {
        "Ah, indeed, what a peculiar sight it is to observe you, a human, employing such a",
        "rudimentary contraption as the mouse.",
        " ",
        "This is strike one my dear. Move along now. Quit this screen without your mouse.",
        "(use ':q' to exit.)"
    },

    {
        "If you were to witness the finesse with which we felines navigate the digital realm,",
        "you would be simply flabbergasted. Our paws glide gracefully across the keyboard, akin",
        "to a virtuoso pianist playing a delightful symphony. The mere thought of resorting to",
        "a crude pointing device is absolutely ghastly!",
        " ",
        "Strike Two. I believe you're one away.",
        "(use ':q' to exit.)"
    },

    {
        "Toodles."
    }
}

function M.get_display_message()
    local table = default_table
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
