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
return M
