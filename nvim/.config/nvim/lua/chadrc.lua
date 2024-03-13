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
}

return M
