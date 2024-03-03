-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
vim.g.maplocalleader = ","

vim.opt.rnu = true

vim.opt.conceallevel = 2

vim.g.lua_snippets_path = vim.fn.stdpath("config") .. "/lua/custom/LuaSnips"
