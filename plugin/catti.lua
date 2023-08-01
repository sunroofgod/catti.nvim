vim.api.nvim_create_user_command("ToggleCattiMode", function()
    require("catti").catti_mode_toggle()
end, {
})
