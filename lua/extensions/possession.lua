require('possession').setup {
    autosave = {
        current = true,
        on_load = true,
        on_quit = true
    },
    commands = {
        save = 'SSave',
        load = 'SLoad',
        rename = 'SRename',
        close = 'SClose',
        delete = 'SDelete',
        list = 'SList'
    }
}

require('telescope').load_extension('possession')
