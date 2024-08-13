return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.cmake_format,
				null_ls.builtins.formatting.clang_format,
                null_ls.builtins.diagnostics.cmake_lint,
                null_ls.builtins.completion.tags,
				null_ls.builtins.completion.luasnip,
			},
		})
		vim.keymap.set("n", "<leader>gf", function()
			local filetype = vim.bo.filetype
			if filetype == "cpp" or filetype == "c" or filetype == "py" then
				vim.lsp.buf.format({ timeout_ms = 2000 })
			else
				print("No formatting available for this file type")
			end
		end, { noremap = true, silent = true })
	end,
}
