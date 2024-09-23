--vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- vim.opt.colorcolumn = "80"
vim.opt.wildignore:append { '*/node_nodules/*', '*/dist/*'}

-- vim.g.netrw_banner = 0
--

-- Lua function to clear all Vim registers
function ClearRegs()
  local registers = {
    '"',  -- unnamed register
    '0',  -- yank register
    '1', '2', '3', '4', '5', '6', '7', '8', '9', -- numbered registers
    'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', -- named registers
    '-',  -- small delete register
  }

  -- Clear each register
  for _, reg in ipairs(registers) do
    vim.fn.setreg(reg, "")
  end
end

