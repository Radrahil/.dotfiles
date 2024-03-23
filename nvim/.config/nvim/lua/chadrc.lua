local M = {}

M.ui = {
	theme = "yoru",
	theme_toggle = { "yoru", "one_light" },

	changed_themes = {
		yoru = {
			base_16 = {
				base00 = "#000000",
			},
		},
	},

	nvdash = {
		load_on_startup = true,
	},

	tabufline = {
		enabled = false,
	},

	cmp = {
		style = "flat_dark",
	},

	statusline = {
		theme = "minimal",
		separator_style = "round",
		-- overriden_modules = nil,
	},
	term = {
		-- hl = "Normal:term,WinSeparator:WinSeparator",
		sizes = { sp = 0.3, vsp = 0.2 },
		float = {
			relative = "editor",
			row = 0.1,
			col = 0.1,
			width = 0.8,
			height = 0.7,
			border = "single",
		},
	},
}

return M
