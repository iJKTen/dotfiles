--\vim.opt.guicursor = ""

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
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- vim.opt.colorcolumn = "80"
vim.opt.wildignore:append { '*/node_nodules/*'}

-- Create an autocommand group
vim.api.nvim_create_augroup("MarkdownColorColumn", { clear = true })

-- Set the color column to 80 for Markdown files
vim.api.nvim_create_autocmd("FileType", {
  group = "MarkdownColorColumn",
  pattern = "markdown",
  callback = function()
    vim.opt.colorcolumn = "80"
  end
})

