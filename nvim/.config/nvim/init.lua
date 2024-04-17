vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

vim.g.maplocalleader = ","

vim.g.tex_flavor = "latex"

vim.opt.conceallevel = 2

vim.opt.relativenumber = true

vim.o.cmdheight = 0

vim.opt.termguicolors = true

vim.o.showtabline=false

vim.g.lua_snippets_path = vim.fn.stdpath("config") .. "/lua/LuaSnips"

if vim.g.neovide then
  vim.o.guifont = "JetBrainsMono Nerd Font Mono:h18"
  vim.g.neovide_cursor_vfx_mode = "railgun"
end

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require "options"
    end,
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)
