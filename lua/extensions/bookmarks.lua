require('bookmarks').setup {
    -- sign_priority = 8,  --set bookmark sign priority to cover other sign
    save_file = vim.fn.expand "$HOME/.bookmarks", -- bookmarks save file path
    keywords = {
        ["@t"] = "☑️ ", -- mark annotation startswith @t ,signs this icon as `Todo`
        ["@w"] = "⚠️ ", -- mark annotation startswith @w ,signs this icon as `Warn`
        ["@f"] = "⛏️ ", -- mark annotation startswith @f ,signs this icon as `Fix`
        ["@n"] = "🗒️", -- mark annotation startswith @n ,signs this icon as `Note`
    },
}

