-- all vim-related options, non lua
local opt = vim.opt
local g = vim.g
local settings = require("core.settings")

-- OS check, to account for clipboard and binary locations
local is_windows = vim.loop.os_uname().sysname == "Windows_NT"

g.mapleader = " "
opt.spelllang = "en"

vim.opt.clipboard = "unnamedplus"

if settings.global_statusline then
  opt.laststatus = 3 -- global statusline
else
  opt.laststatus = 2
end

-- winbar
vim.opt.winbar = "%{%v:lua.require'utils.winbar'.get_winbar()%}"

opt.cursorline = true

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

-- nvim-ufo folding
opt.foldcolumn = "1"
opt.foldlevel = 99
opt.foldlevelstart = -1
opt.foldenable = true
opt.fillchars = { eob = " ", fold = " ", foldopen = " ", foldsep = " ", foldclose = " " }
--
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- Numbers
opt.number = true
opt.numberwidth = 2
opt.ruler = false

-- disable nvim intro
opt.shortmess:append("sI")

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 25

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append("<>[]hl")

-- Add binaries installed by mason.nvim to PATH
local path_separator = is_windows and ";" or ":"
local mason_bin_path = vim.fn.stdpath("data") .. (is_windows and "\\mason\\bin" or "/mason/bin")
vim.env.PATH = vim.env.PATH .. path_separator .. mason_bin_path

vim.api.nvim_set_var(
  "guicursor",
  "n-v-c:block-Cursor/lCursor-blinkon0,i-ci-ve:ver25-Cursor/lCursor-blinkon0,r-cr:hor20-Cursor/lCursor-blinkon0"
)

vim.o.cmdheight = 1

vim.o.title = true
vim.o.titlestring = "nvim/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
vim.o.titleold = "Terminal"
