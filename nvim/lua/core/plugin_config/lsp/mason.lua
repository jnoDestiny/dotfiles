local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local mason_tool_installer = require("mason-tool-installer")

mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})

mason_lspconfig.setup({
    -- servers to install
    ensure_installed = {
    "lua_ls",
    -- "pyright",
    },
})

-- TODO: Make these work
-- mason_tool_installer.setup({
--     ensure_installed = {
--     "prettier",
--     "stylua", -- lua
--     "isort", -- python
--     "black", -- python
--     "pylint",
--     },
--
--     automatic_installation = true,
-- })

