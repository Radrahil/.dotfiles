local M = {}

M.term = {
  -- hl = "Normal:term,WinSeparator:WinSeparator",
  float = {
    relative = "editor",
    row = 0,
    col = 0,
    width = 1,
    height = 1,
    border = "single",
  },
}


	M.nvdash = {
		load_on_startup = true,
		header = {
			"                                                                       ",
			"                                                                     ",
			"       ████ ██████           █████      ██                     ",
			"      ███████████             █████                             ",
			"      █████████ ███████████████████ ███   ███████████   ",
			"     █████████  ███    █████████████ █████ ██████████████   ",
			"    █████████ ██████████ █████████ █████ █████ ████ █████   ",
			"  ███████████ ███    ███ █████████ █████ █████ ████ █████  ",
			" ██████  █████████████████████ ████ █████ █████ ████ ██████ ",
			"                                                                       ",
		},
	}

M.ui = {
	tabufline = {
		enabled = false,
	},

	cmp = {
		style = "flat_dark",
	},

	statusline = {
		theme = "minimal",
		separator_style = "round",{
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "sindrets/diffview.nvim",        -- optional - Diff integration

    -- Only one of these is needed, not both.
    "nvim-telescope/telescope.nvim", -- optional
    "ibhagwan/fzf-lua",              -- optional
  },
  config = true
}
		-- overriden_modules = nil,
	},
}

M.base46 = {

	theme = "yoru",
	theme_toggle = { "yoru", "one_light" },

	changed_themes = {
		yoru = {
			base_16 = {
				base00 = "#000000",
			},
		},
	},

	hl_override = {
		NvDashAscii = {
			fg = "cyan",
			bg = "none",
		},

		NvDashButtons = {
			fg = "white",
			bg = "none",
		},

    TelescopeNormal = {
      bg = "#000000",
    },

    TelescopePromptNormal = {
      bg = "#000000",
    },

    TelescopePromptPrefix = {
      bg = "#000000",
    },


    TelescopeResultsTitle = {
      fg = "#000000",
    },

    TelescopePreviewTitle = {
      fg = "#000000",
    },


	},

	telescope = {
		style = "bordered",
	},


}

return M
