require("telescope").setup({
    defaults = {
        sorting_strategy = "ascending",
        layout_strategy = "vertical",
        layout_config = {
            width = 0.5,
            prompt_position = "top",
            vertical = {
                prompt_position = "top",
                mirror = true
            }
        }
    },
    pickers = {
        find_files = {
            hidden = true
        }
    }
})
