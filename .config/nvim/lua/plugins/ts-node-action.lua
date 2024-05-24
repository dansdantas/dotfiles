return {
	"ckolkey/ts-node-action",
	dependencies = { "nvim-treesitter" },
	opts = {},
	keys = {
		{ "<c-c>", function() require("ts-node-action").node_action() end, desc = "TS: node action" },
	},
}
