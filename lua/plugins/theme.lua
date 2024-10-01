return {
    {
        "navarasu/onedark.nvim",
        name = "onedark",
        config = function ()
            require("onedark").setup({
                style = "darker",
            })
            require("onedark").load()
        end,
    },
    {
        "catppuccin/nvim",
	    name = "catppuccin",
        priority = 1000,
	    config = function()
        end,
    },
}
