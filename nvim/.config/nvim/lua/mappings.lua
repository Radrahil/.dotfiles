require("nvchad.mappings")

-- Disabling mappings
local nomap = vim.keymap.del

nomap({ "i" }, "<C-k>")

nomap({ "n" }, "<C-k>")

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<leader>fm", function()
	require("conform").format()
end, { desc = "File Format with conform" })

map("i", "jk", "<ESC>", { desc = "Escape insert mode" })

-- M.general
map({ "n" }, ";", ":", { desc = "enter command mode", nowait = true })

map({ "n" }, "<leader>tt", "<cmd> TroubleToggle <CR>")
-- map({ "n" }, "<leader>x", ":bdelete<CR>", { desc = "close buffer" })

-- M.dap
map({ "n" }, "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Add breakpoint at line" })

map({ "n" }, "<leader>dr", "<cmd> DapContinue <CR>", { desc = "Start or continue the debugger" })

map("n", "<F5>", "<cmd>DapContinue<CR>", { desc = "Continue debugging" })
map("n", "<F6>", "<cmd>DapTerminate<CR>", { desc = "Stop debugging" })
map("n", "<F10>", "<cmd>DapStepOver<CR>", { desc = "Step over" })
map("n", "<F11>", "<cmd>DapStepInto<CR>", { desc = "Step into" })
map("n", "<F12>", "<cmd>DapStepOut<CR>", { desc = "Step out" })
map("n", "<Leader>dp", "<cmd>DapLogpoint<CR>", { desc = "Set log point" })
map("n", "<Leader>dr", "<cmd>DapReplOpen<CR>", { desc = "Open REPL" })
map("n", "<Leader>dl", "<cmd>DapRunLast<CR>", { desc = "Debug last configuration" })
map({ "n", "v" }, "<Leader>dh", '<cmd>lua require("dap.ui.widgets").hover()<CR>', { desc = "Show hover information" })
map({ "n", "v" }, "<Leader>dp", '<cmd>lua require("dap.ui.widgets").preview()<CR>', { desc = "Preview information" })
map(
	"n",
	"<Leader>df",
	'<cmd>lua local widgets = require("dap.ui.widgets"); widgets.centered_float(widgets.frames)<CR>',
	{ desc = "Show frames" }
)
map(
	"n",
	"<Leader>ds",
	'<cmd>lua local widgets = require("dap.ui.widgets"); widgets.centered_float(widgets.scopes)<CR>',
	{ desc = "Show scopes" }
)

-- luasnip
map({ "i" }, "<tab>", function()
	return vim.fn["luasnip#expand_or_jumpable"]() and "<plug>luasnip-expand-or-jump" or "<tab>"
end, { silent = true, expr = true })

map({ "s" }, "<tab>", function()
	return vim.fn["luasnip#jumpable"](1) and "<plug>luasnip-jump-next" or "<tab>"
end, { silent = true, expr = true })

map({ "i" }, "<s-tab>", function()
	return vim.fn["luasnip#jumpable"](-1) and "<plug>luasnip-jump-prev" or "<s-tab>"
end, { silent = true, expr = true })

map({ "s" }, "<s-tab>", function()
	return vim.fn["luasnip#jumpable"](-1) and "<plug>luasnip-jump-prev" or "<s-tab>"
end, { silent = true, expr = true })

-- noice
map({ "n" }, "<leader><leader>", function()
	require("noice").cmd("dismiss")
end, { desc = "Clear notifications" })

-- oil
map({ "n" }, "-", "<CMD> Oil<CR>", { desc = "Open parent directory" })

-- buffers

map({ "n" }, "<tab>", "<cmd> bnext <CR>", { desc = "Next buffer" })
map({ "n" }, "<s-tab>", "<cmd> bprevious <CR>", { desc = "Previous buffer" })

-- tmux

map({ "n", "t" }, "<C-h>", "<CMD>TmuxNavigateLeft<CR>")
map({ "n", "t" }, "<C-l>", "<CMD>TmuxNavigateRight<CR>")
map({ "n", "t" }, "<C-k>", "<CMD>TmuxNavigateUp<CR>")
map({ "n", "t" }, "<C-j>", "<CMD>TmuxNavigateDown<CR>")
map({ "n", "t" }, "<C-p>", "<CMD>TmuxNavigatePrevious<CR>")
