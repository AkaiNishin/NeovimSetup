return {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        -- Use :TSUpdate to manually update parsers if needed
        vim.cmd("TSUpdate")
    end,
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed = { "cpp", "cmake", "lua", "c", "python"},
            sync_install = false,
            highlight = {
                enable = true,
                -- Set to true if needed
                additional_vim_regex_highlighting = false,
            },
            indent = { enable = true },
            incremental_selection = { enable = true },
            textobjects = { enable = true },
            refactor = { enable = true },
        })
    end,
}

