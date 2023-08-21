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
            action = 'Telescope possession list',
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
            action = 'SLoad config',
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
