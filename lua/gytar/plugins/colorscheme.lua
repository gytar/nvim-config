return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	lazy = false,
	config = function ()
		vim.g.catppuccin_flavour = "mocha"
		require("catppuccin").setup()
		vim.cmd [[colorscheme catppuccin]]
	end
}
