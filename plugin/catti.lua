vim.api.nvim_create_user_command("ToggleCattiMode", function()
    package.loaded.catti = nil
    local catti = require("catti.catti_mode")
    catti.catti_mode_toggle()
end, {
})
