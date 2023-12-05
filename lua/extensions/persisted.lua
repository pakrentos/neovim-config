vim.opt.sessionoptions = { -- required
    "buffers",
    "curdir",
    "folds",
    "globals",
    "resize",
    "tabpages",
    "winsize",
}

require("persisted").setup({
    follow_cwd = false, -- change session file name to match current working directory if it changes
    autocreate = true,
})

require("telescope").load_extension("persisted")

-- define a command to close sesssion
function SessionClose()
    cmd [[SessionStop]]
    cmd [[%bd]]
    cmd [[cd]]
end

cmd [[command! -nargs=0 SessionClose lua SessionClose()]]

-- auto save/load scope

require("scope").setup({})

local group = vim.api.nvim_create_augroup("PersistedHooks", {})

vim.api.nvim_create_autocmd({ "User" }, {
    pattern = "PersistedSavePost",
    group = group,
    callback = function()
        cmd [[ScopeSaveState]]
    end,
})

vim.api.nvim_create_autocmd({ "User" }, {
    pattern = "PersistedLoadPost",
    group = group,
    callback = function()
        cmd [[ScopeLoadState]]
        cmd [[e]]
    end,
})
