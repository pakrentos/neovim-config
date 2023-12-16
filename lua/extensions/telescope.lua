local telescope = require("telescope")

telescope.setup({
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
        },
        file_ignore_patterns = {
            "node%_modules/.*",
            "target/.*",
        }
    },
    pickers = {
        find_files = {
            hidden = true
        },
        lsp_references = {
            fname_width = 200,
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,             -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        }
    }
})

telescope.load_extension('bookmarks')
telescope.load_extension("live_grep_args")
telescope.load_extension("fzf")
