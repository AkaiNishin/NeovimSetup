return {
    "mikavilpas/yazi.nvim",
    config = function ()
        vim.keymap.set("n", "<C-y>", ":Yazi<CR>")
        require("yazi").setup({
            floating_window_scaling_factor = 0.8,
            yazi_floating_window_border = "rounded",
        })
    end,
}
