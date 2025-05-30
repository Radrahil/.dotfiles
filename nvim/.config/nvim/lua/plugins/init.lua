local overrides = require("configs.overrides")

return {
	{
		"stevearc/conform.nvim",
		config = function()
			require("configs.conform")
		end,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = {
			git = { enable = true },
			view = { side = "right" },
		},
	},
	-- Override plugin definition options

	-- override plugin configs
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"clangd",
				"clang-format",
			},
			overrides.mason,
		},
	},

	-- {
	-- 	"nvim-treesitter/nvim-treesitter",
	-- 	opts = overrides.treesitter,
	-- 	dependencies = {
	-- 		{ "HiPhish/rainbow-delimiters.nvim" },
	-- 	},
	-- },

	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},

	{
		"L3MON4D3/LuaSnip",
		opts = {
			-- Enable autotriggered snippets
			enable_autosnippets = true,

			-- Use Tab (or some other key if you prefer) to trigger visual selection
			store_selection_keys = "<Tab>",
		},
	},

	-- Install a plugin
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},

	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
	},

	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},

	{
		"jay-babu/mason-nvim-dap.nvim",
		event = "VeryLazy",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		opts = {
			handlers = {},
		},
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			require("nvchad.configs.lspconfig").defaults()
			require("configs.lspconfig")
		end,
	},
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"clangd",
				"clang-format",
				"codelldb",
			},
		},
	},

	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>tt",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>tT",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>ts",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>tl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>tL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>tQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},

	{
		"nvim-neorg/neorg",
		cmd = "Neorg",
		ft = "norg", -- lazy load on filetype
		dependencies = { "nvim-lua/plenary.nvim", "luarocks.nvim" },
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {}, -- Loads default behaviour
					["core.concealer"] = {
						config = {
							folds = false,
						},
					}, -- Adds pretty icons to your documents
					["core.dirman"] = { -- Manages Neorg workspaces
						config = {
							workspaces = {
								notes = "~/notes",
							},
							default_workspace = "notes",
						},
					},
					["core.integrations.image"] = {},
					["core.latex.renderer"] = {
						-- config = {
						-- 	render_on_enter = false,
						-- },
					},
					["core.integrations.nvim-cmp"] = {},
				},
			})
		end,
	},
	--
	{
		"nanotee/zoxide.vim",
		lazy = false,
	},
	--
	{
		"junegunn/fzf.vim",
		lazy = false,
	},

	{
		"junegunn/fzf",
		lazy = false,
	},

	{

		"lervag/vimtex",
		lazy = false,
		init = function()
			vim.g.vimtex_view_method = "zathura"
			vim.g.vimtex_compiler_method = "latexmk"
			vim.g.vimtex_latexkm_options =
				"-pdf -shell-escape -verbose -file-line-error -synctex=1 -interaction=nonstopmode"
			vim.g.vimtex_quickfix_open_on_warning = 0
			vim.g.vimtex_fold_enable = 1
		end,
	},

	{
		"chentoast/marks.nvim",
		lazy = false,
		config = function()
			require("marks").setup({})
		end,
	},

	{
		"tpope/vim-fugitive",
		cmd = "Git",
	},

	{
		"mrcjkb/rustaceanvim",
		ft = { "rust" },
		config = function(_, _)
			vim.g.rustaceanvim = {
				server = {
					on_attach = require("nvchad.configs.lspconfig").on_attach,
				},
			}
		end,
	},

	-- {
	-- 	"folke/noice.nvim",
	-- 	event = "VeryLazy",
	-- 	opts = {
	-- 		-- add any options here
	-- 	},
	-- 	dependencies = {
	-- 		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
	-- 		"MunifTanjim/nui.nvim",
	-- 		-- OPTIONAL:
	-- 		--   `nvim-notify` is only needed, if you want to use the notification view.
	-- 		--   If not available, we use `mini` as the fallback
	-- 		"rcarriga/nvim-notify",
	-- 	},
	-- 	config = function()
	-- 		require("configs.noice")
	-- 	end,
	-- },

	{
		"lukas-reineke/headlines.nvim",
		ft = "norg",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = true, -- or `opts = {}`
	},

	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration

			-- Only one of these is needed, not both.
			"nvim-telescope/telescope.nvim", -- optional
			"ibhagwan/fzf-lua", -- optional
		},
		config = true,
		cmd = "Neogit",
	},

	-- {
	-- 	"Bekaboo/dropbar.nvim",
	-- 	-- optional, but required for fuzzy finder support
	-- 	dependencies = {
	-- 		"nvim-telescope/telescope-fzf-native.nvim",
	-- 	},
	-- },

	{ "rebelot/kanagawa.nvim" },

	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration

			-- Only one of these is needed, not both.
			"nvim-telescope/telescope.nvim", -- optional
		},
		config = true,
		cmd = "Neogit",
	},

	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
	},
	{
		"Julian/lean.nvim",
		event = { "BufReadPre *.lean", "BufNewFile *.lean" },

		dependencies = {
			"neovim/nvim-lspconfig",
			"nvim-lua/plenary.nvim",
			-- you also will likely want nvim-cmp or some completion engine
		},

		-- see details below for full configuration options
		opts = {
			lsp = {
				on_attach = on_attach,
			},
			mappings = true,
		},
	},

	{
		"tris203/precognition.nvim",
		cmd = "Precognition",
		config = {},
	},

	{
		"famiu/bufdelete.nvim",
	},

	{
		"OXY2DEV/helpview.nvim",
		lazy = false, -- Recommended

		-- In case you still want to lazy load
		-- ft = "help",

		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
	},

	"nvzone/volt",
	{ "nvzone/timerly", cmd = "TimerlyToggle" },
	{
		"OXY2DEV/markview.nvim",
		lazy = false,
	},
	---@type LazySpec
	{
		"mikavilpas/yazi.nvim",
		event = "VeryLazy",
		dependencies = { "folke/snacks.nvim", lazy = true },
		keys = {
			-- 👇 in this section, choose your own keymappings!
			{
				"<leader>-",
				mode = { "n", "v" },
				"<cmd>Yazi<cr>",
				desc = "Open yazi at the current file",
			},
			{
				-- Open in the current working directory
				"<leader>cw",
				"<cmd>Yazi cwd<cr>",
				desc = "Open the file manager in nvim's working directory",
			},
			{
				"<c-up>",
				"<cmd>Yazi toggle<cr>",
				desc = "Resume the last yazi session",
			},
		},
		---@type YaziConfig | {}
		opts = {
			-- if you want to open yazi instead of netrw, see below for more info
			open_for_directories = false,
			keymaps = {
				show_help = "<f1>",
			},
		},
	},
  {
    "ficcdaf/ashen.nvim",
    -- optional but recommended,
    -- pin to the latest stable release:
    lazy = false,
    priority = 1000,
    -- configuration is optional!
    opts = {
      -- your settings here
    },
  },

  { import = "nvchad.blink.lazyspec" },

	-- To make a plugin not be loaded
	-- {
	--   "NvChad/nvim-colorizer.lua",
	--   enabled = false
	-- },

	-- All NvChad plugins are lazy-loaded by default
	-- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
	-- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
	-- {
	--   "mg979/vim-visual-multi",
	--   lazy = false,
	-- }
}
