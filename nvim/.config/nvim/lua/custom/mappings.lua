---@type MappingsTable
local M = {}

M.disabled = {
	n = {
		["<Tab>"] = "",
	},
}

M.general = {
	n = {
		[";"] = { ":", "enter command mode", opts = { nowait = true } },
		["<leader>tt"] = { "<cmd> TroubleToggle <CR>" },
	},
}

-- more keybinds!

M.dap = {
	plugin = true,
	n = {
		["<leader>db"] = {
			"<cmd> DapToggleBreakpoint <CR>",
			"Add breakpoint at line",
		},
		["<leader>dr"] = {
			"<cmd> DapContinue <CR>",
			"Start or continue the debugger",
		},
	},
}

M.harpoon = {
	n = {
		["<leader>a"] = {
			function()
				require("harpoon"):list():append()
			end,
			"Harpoon add file",
		},
		["<C-e>"] = {
			function()
				require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
			end,
			"Harpoon toggle menu",
		},
		["<leader>1"] = {
			function()
				require("harpoon"):list():select(1)
			end,
			"Harpoon nav file 1",
		},
		["<leader>2"] = {
			function()
				require("harpoon"):list():select(2)
			end,
			"Harpoon nav file 2",
		},
		["<leader>3"] = {
			function()
				require("harpoon"):list():select(3)
			end,
			"Harpoon nav file 3",
		},
		["<leader>4"] = {
			function()
				require("harpoon"):list():select(4)
			end,
			"Harpoon nav file 4",
		},
		["<leader>5"] = {
			function()
				require("harpoon"):list():select(5)
			end,
			"Harpoon nav file 5",
		},
	},
}

return M
