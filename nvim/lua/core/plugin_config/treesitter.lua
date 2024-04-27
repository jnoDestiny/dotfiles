require'nvim-treesitter.install'.prefer_git = true
require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    ensure_installed = { "c", "cpp", "python", "json", "lua", "rust", "ruby", "markdown", "elixir", "vim" },

    -- Install parsers synchronously (only applied to 'ensure_installed')
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
    },
}

