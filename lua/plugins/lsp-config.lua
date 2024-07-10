return {
    {
    "williamboman/mason.nvim",
    config = function()
        require("mason").setup()
    end,
    },
    {
    "williamboman/mason-lspconfig.nvim",
    config = function()
        require("mason-lspconfig").setup({
            ensure_installed = {
                    "lua_ls",
                    "clangd",
                    "cmake"
                }
            })
    end,
    },
    {
    "neovim/nvim-lspconfig",
    config = function()
        -- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        local lspconfig = require("lspconfig")
        --
        lspconfig.lua_ls.setup({
                capabilities = capabilities
            })
        lspconfig.clangd.setup({
                capabilities = capabilities
            })
        lspconfig.cmake.setup({
                capabilities = capabilities
            })
        vim.keymap.set('n','K',vim.lsp.buf.hover, {})
    end,
    }
}

