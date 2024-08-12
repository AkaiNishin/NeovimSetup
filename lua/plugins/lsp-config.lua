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
					"cmake",
                    "pyright",
                    "jedi_language_server",
                    "asm_lsp",
                    "svls",
                    "texlab",
				},
            automatic_installation = true, -- Ensure servers are installed
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

            -- Custom function to find the root directory
            local function find_root_dir(fname)
                return require("lspconfig.util").find_git_ancestor(fname)
            end

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.clangd.setup({
				capabilities = capabilities,
                cmd = {
                    "clangd",
                    -- Adjust as needed
                    "--compile-commands-dir=build",
                    -- Disable automatic header insertion if it interferes
                    "--header-insertion=never",
                },
			})
			lspconfig.cmake.setup({
				capabilities = capabilities,
			})
            lspconfig.pyright.setup({
                capabilities = capabilities,
            })
            lspconfig.jedi_language_server.setup({
                capabilities = capabilities
            })
            lspconfig.asm_lsp.setup({
                capabilities = capabilities
            })
            lspconfig.svls.setup({
                capabilities = capabilities,
                root_dir = find_root_dir,
                cmd = {"svls"},
                filetypes = {"verilog", "systemverilog"},
            })
            lspconfig.texlab.setup({
                capabilities = capabilities
            })
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		    vim.lsp.set_log_level("debug")
        end,
	},
}

