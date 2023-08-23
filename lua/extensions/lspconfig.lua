local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")

require("mason").setup()

mason_lspconfig.setup({
    ensure_installed = {
    "lua_ls",        -- LSP for Lua language
    "tsserver",      -- LSP for Typescript and Javascript
    "pyright",       -- LSP for Python
    "rust_analyzer", -- LSP for Rust
    "taplo",         -- LSP for TOML
    "wgsl_analyzer"  -- LSP for WebGPU Shading Language
    }
});

-- Setup every needed language server in lspconfig
mason_lspconfig.setup_handlers {function(server_name)
    lspconfig[server_name].setup {}
end}

-- this is for diagnositcs signs on the line number column
-- use this to beautify the plain E W signs to more fun ones
-- !important nerdfonts needs to be setup for this to work in your terminal
local signs = {
    Error = "",
    Warn = "",
    Hint = " ",
    Info = " "
}
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {
        text = icon,
        texthl = hl,
        numhl = hl
    })
end
