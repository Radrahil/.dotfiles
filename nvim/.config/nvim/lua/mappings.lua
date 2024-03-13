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

-- M.harpoon
map({ "n" }, "<leader>a", function()
	require("harpoon"):list():append()
end, { desc = "Harpoon add file" })
map({ "n" }, "<C-e>", function()
	require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
end, { desc = "Harpoon toggle menu" })
map({ "n" }, "<leader>1", function()
	require("harpoon"):list():select(1)
end, { desc = "Harpoon nav file 1" })
map({ "n" }, "<leader>2", function()
	require("harpoon"):list():select(2)
end, { desc = "Harpoon nav file 2" })
map({ "n" }, "<leader>3", function()
	require("harpoon"):list():select(3)
end, { desc = "Harpoon nav file 3" })
map({ "n" }, "<leader>4", function()
	require("harpoon"):list():select(4)
end, { desc = "Harpoon nav file 4" })
map({ "n" }, "<leader>5", function()
	require("harpoon"):list():select(5)
end, { desc = "Harpoon nav file 5" })

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
