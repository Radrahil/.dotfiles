---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require("custom.highlights")

M.ui = {
	theme = "yoru",
	theme_toggle = { "yoru", "one_light" },

	hl_override = highlights.override,

	hl_add = highlights.add,

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
		enabled = true,
	},

	statusline = {
		theme = "minimal",
		separator_style = "round",
		-- overriden_modules = nil,
	},
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require("custom.mappings")

return M
