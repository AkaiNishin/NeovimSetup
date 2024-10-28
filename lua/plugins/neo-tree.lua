return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "<C-t>", ":Neotree filesystem reveal left<CR>")
	    vim.keymap.set("n", "<C-t>", ":Neotree toggle<CR>")
        require("neo-tree").setup({
            filesystem = {
                window = {
                    mappings = {
                        ["<leader>p"] = "image_wezterm", -- " or another map
                    },
                },
                filtered_items = {
                    hide_dotfiles = false,
                    hide_gitignore = false,
                },
                commands = {
                    image_wezterm = function(state)
                    local node = state.tree:get_node()
                    if node.type == "file" then
                        require("image_preview").PreviewImage(node.path)
                    end
                    end,
                },
            },
        })
    end,
}
