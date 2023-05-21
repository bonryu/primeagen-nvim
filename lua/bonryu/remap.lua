-- local opts = { noremap = true, silent = false }
-- local opts_silent = { noremap = true, silent = true }
-- local term_opts = { silent = true}
--
-- -- Shorten function name
-- local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
-- keymap("", "<Space", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--  normal_mode = "n"
--  insert_mode = "i"
--  visula_mode = "v",
--  visual_block_mode = "x",
--  term_mode = "t",
--  command_mode = "c",

-- Better window navigation
-- vim.keymap.set("n", "<A-h>", "<C-w>h")
-- vim.keymap.set("n", "<A-j>", "<C-w>j")
-- vim.keymap.set("n", "<A-k>", "<C-w>k")
-- vim.keymap.set("n", "<A-l>", "<C-w>l")
-- vim.keymap.set("n", "<A-p>", "<C-w>p")  -- go to previous windowv

-- Stay in indent mode
-- vim.keymap.set("v", "<", "<gv")
-- vim.keymap.set("v", ">", ">gv")

-- Navigate buffers
-- vim.keymap.set("n", "<S-l>", ":bnext<CR>")
-- vim.keymap.set("n", "<S-h>", ":bprevious<CR>")

-- Show explorer/netrw
-- vim.keymap.set("n", "<leader>e", ":Vex 20<cr>")
-- vim.keymap.set("n", "<leader>pv", ":Ex<CR>", opts_silent)
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<cr>", opts_silent)
-- vim.keymap.set("n", "<leader>e", ":NvimTreeFocus<cr>", opts_silent)


-- leaves cursor in place when joining lines
-- vim.keymap.set("n", "J", "mzJ`z")
-- leaves cursor in place while half page jumping
-- zz in vim centres screen on current line
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- allows searched and found terms to stay in the middle
-- vim.keymap.set("n", "n", "nzzzv")
-- vim.keymap.set("n", "N", "Nzzzv")


-- make Q do nothing
-- vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<C-f>", "<cmd>!tmux neww tmux-sessionizer<CR>")
-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- what is this? look back at primeagen's 0 to lsp video
-- vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
-- "<cmd>e filename" will edit filename
vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/bonryu/packer.lua<CR>");
-- vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

-- vim.keymap.set("n", "<leader><leader>", function() vim.cmd("so") end)
