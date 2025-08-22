require("wrapping").setup({
    auto_set_mode_filetype_allowlist = {
        "markdown",
        "tex"
    },
    softener = {
        markdown = true,
        tex = true
    },
    soft_wrap_mode_config = {
        textwidth = vim.o.textwidth -- This will use your system's textwidth instead of 999999
    }
})
