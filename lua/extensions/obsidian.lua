require("obsidian").setup {

    workspaces = {
        {
            name = "personal",
            path = "~/kernel-vault",
        },
    },
    daily_notes = {
        -- Optional, if you keep daily notes in a separate directory.
        folder = "Daily reports",
        -- Optional, if you want to change the date format for the ID of daily notes.
        date_format = "%d-%m-%Y",
        -- Optional, default tags to add to each new daily note created.
        default_tags = { "daily-report" },
        -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
        template = "Meta/Types/Daily report.md"
    },
    templates = {
        folder = "Meta/Types",
        date_format = "%d-%m-%Y",
        time_format = "%H:%M",
        -- A map for custom variables, the key should be the variable and the value a function
        substitutions = {},
    },
    note_frontmatter_func = function(note)
        -- Add the title of the note as an alias.
        if note.title then
            note:add_alias(note.title)
        end

        local out = { ["parent-moc"] = "[[Unsorted-MOC]]" }

        -- `note.metadata` contains any manually added fields in the frontmatter.
        -- So here we just make sure those fields are kept in the frontmatter.
        if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
            for k, v in pairs(note.metadata) do
                out[k] = v
            end
        end
        
        return out
    end,

    note_id_func = function(title)
        -- Use the title as-is for the note ID.
        return title
    end,

    note_path_func = function(spec)
        -- Customize the file name to be the note ID (title) with the ".md" extension.
        local path = spec.dir / spec.id
        return path:with_suffix(".md")
    end,

    -- ... other configuration options ...
}
