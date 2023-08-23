require("dashboard").setup({
    theme = 'hyper',
    config = {
        week_header = {
            enable = true
        },
        shortcut = {{
            desc = ' Empty',
            group = '@variable',
            action = 'enew',
            key = 'e'
        }, {
            desc = '󱔗 Sessions',
            group = 'Number',
            action = 'Telescope persisted',
            key = 's'
        }, {
            desc = ' Plugins',
            group = '@property',
            action = 'Lazy',
            key = 'p'
        }, {
            desc = ' Mason',
            group = '@property',
            action = 'Mason',
            key = 'm'
        }, {
            icon = ' ',
            desc = 'Files',
            group = '@property',
            action = 'Telescope find_files',
            key = 'f'
        }, {
            desc = ' Settings',
            group = '@property',
            action = 'SessionLoadFromFile ~/.local/share/nvim/sessions/%Users%alestsurko%.config%nvim@@main.vim',
            key = ','
        }, {
            desc = ' Quit',
            group = '@variable',
            action = 'qa',
            key = 'q'
        }},
        project = {
            label = "Recently Opened Directories"
        },
        mru = {
            label = "Recently Opened Files"
        }
    }
})
