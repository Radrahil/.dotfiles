local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
vim.g.maplocalleader = ","

vim.opt.rnu = true

vim.opt.conceallevel = 2

vim.g.lua_snippets_path = vim.fn.stdpath("config") .. "/lua/custom/LuaSnips"

vim.g.tex_flavor = "latex"

vim.cmd([[
" use tab to expand and jump through snippets
imap <silent><expr> <tab> luasnip#expand_or_jumpable() ? '<plug>luasnip-expand-or-jump' : '<tab>' 
smap <silent><expr> <tab> luasnip#jumpable(1) ? '<plug>luasnip-jump-next' : '<tab>'

" use shift-tab to jump backwards through snippets
imap <silent><expr> <s-tab> luasnip#jumpable(-1) ? '<plug>luasnip-jump-prev' : '<s-tab>'
smap <silent><expr> <s-tab> luasnip#jumpable(-1) ? '<plug>luasnip-jump-prev' : '<s-tab>'
]])

-- autocmd("BufEnter", {
-- 	pattern = "*.tex",
-- 	callback = function()
-- 		require("cmp").setup.buffer({ enabled = false })
-- 	end,
-- })
