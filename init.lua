-- packages --
vim.pack.add({
	'https://github.com/nvim-mini/mini.pick',
	'https://github.com/stevearc/oil.nvim',
	'https://github.com/wnkz/monoglow.nvim',
	'https://github.com/neovim/nvim-lspconfig',
	'https://github.com/mason-org/mason.nvim',
	'https://github.com/mason-org/mason-lspconfig.nvim',
	'https://github.com/lewis6991/gitsigns.nvim',
})

require 'mini.pick'.setup()
require 'oil'.setup()

require 'mason'.setup()
require 'mason-lspconfig'.setup()

require 'gitsigns'.setup {
	current_line_blame = true,
	current_line_blame_opts = {
		delay = 500,
	},
}

vim.cmd 'colorscheme monoglow'

-- options --
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'

vim.opt.wrap = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.list = true

vim.opt.scrolloff = 5

vim.opt.winborder = 'solid'

vim.opt.swapfile = false

-- keymaps --
vim.g.mapleader = " "

vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set('n', 'H', '^')
vim.keymap.set('n', 'L', '$')

vim.keymap.set('n', '<leader>ff', ':Pick files<CR>')
vim.keymap.set('n', '<leader>fw', ':Pick grep_live<CR>')

vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)

vim.keymap.set('n', '<leader>gb', ':Gitsigns blame<CR>')

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		local opts = { buffer = args.buf }
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
	end,
})
