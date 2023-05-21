local status_ok, wk = pcall(require, "which-key")
if not status_ok then
    return
end


-- {
--   mode = "n", -- NORMAL mode
--   -- prefix: use "<leader>f" for example for mapping everything related to finding files
--   -- the prefix is prepended to every mapping part of `mappings`
--   prefix = "",
--   buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
--   silent = true, -- use `silent` when creating keymaps
--   noremap = true, -- use `noremap` when creating keymaps
--   nowait = false, -- use `nowait` when creating keymaps
--   expr = false, -- use `expr` when creating keymaps
-- }

-- move lines up and down in visual mode
-- can't seem to make these work using whick-key syntax so just use vim.keymap.set and use whick-key to set the labels
-- vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- Stay in indent mode
-- vim.keymap.set("v", "<", "<gv")
-- vim.keymap.set("v", ">", ">gv")
local noprefixmappings_visualmode = {
    J = { ":m '>+1<CR>gv=gv", "move lines down in visual mode", mode = "v" },
    K = { ":m '<-2<CR>gv=gv", "move lines up in visual mode", mode = "v" },
    ["<"] = { "<gv", "Indent Left and Stay in indent mode", mode = "v" },
    [">"] = { ">gv", "Indent Right and Stay in indent mode", mode = "v" },
    -- greatest remap ever
    -- delete into the null/void register, then paste before. Use like this:
    -- 1. yiw foo
    -- 2. viw bar
    -- 3. p to replace bar with foo.
    -- 4. optionally "p" to keep pasting foo after the newly pasted "foo"
    -- vim.keymap.set({ "x" }, "p", [["_dP]])
    p = { [["_dP]], '[["_dP]] delete into _ register and paste before', mode = { "x" } }
}
wk.register { noprefixmappings_visualmode }

local noprefixmappings_normalmode = {
    ["J"] = { "mzJ`z", "leaves cursor in place when joining lines" },
    ["<S-l>"] = { ":bnext<CR>", "next buffer" },
    ["<S-h>"] = { ":bprevious<CR>", "previous buffer" },
    ["<A-p>"] = { "<C-w>p", "go to previous window" },
    ["<C-d>"] = { "<C-d>zz", "half page jump down in place" },
    ["<C-u>"] = { "<C-u>zz", "half page jump up in place" },
    ["n"] = { "nzzzv", "nzzzv search and found terms stay in middle" },
    ["N"] = { "Nzzzv", "Nzzzv search and found terms stay in middle" },
    Q = { "<nop>", "<nop> Make Q do nothing", mode = "n" }
}
wk.register { noprefixmappings_normalmode, { mode = "n" } }

local leaderprefixmappings = {
    f = { "<cmd>lua vim.lsp.buf.format()<cr>", "format" },
    e = { "<cmd>NvimTreeFocus<Cr>", "NvimTreeFocus" },
    t = { "<cmd>NvimTreeToggle<Cr>", "NvimTreeToggle" },
    -- -- next greatest remap ever : asbjornHaland
    -- -- remap <leader>[y|Y] to copy to system clipboard
    -- -- vim.keymap.set({ "n", "v", "x" }, "<leader>y", [["+y]])
    -- vim.keymap.set({ "n", "v" }, "<leader>Y", [["+Y]])
    -- -- vim.keymap.set({ "n", "v", "x" }, "<leader>p", [["+p]])
    -- vim.keymap.set({ "n", "v" }, "<leader>P", [["+P]])
    -- vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
    y = { [["+y]], '"+y Copy to system clipboard', mode = { "n", "v" } },
    p = { [["+p]], '"+p Pase from system clipboard', mode = { "n", "v" } },
    Y = { [["+Y]], '"+Y Copy to system clipboard', mode = { "n", "v" } },
    P = { [["+P]], '"+P Pase from system clipboard', mode = { "n", "v" } },
    x = { [["+x]], '"+x Cut into system clipboard', mode = { "n", "v" } },
    s = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "asfd", mode = { "n", "v" } },
    ["<leader>"] = { function() vim.cmd("so") end, 'vim.cmd("so")', mode = "n" },
}
wk.register { leaderprefixmappings, prefix = "<leader>" }

-- File system related
wk.register({
    ["<leader>f"] = {
        name = "+file",
        f = { "<cmd>Telescope find_files<cr>", "Telescope Find File" },
        r = { "<cmd>Telescope oldfiles<cr>", "Telescope Open Recent File" },
        n = { "<cmd>enew<cr>", "New File" },
        g = { "<cmd>Telescope git_files<cr>", "Telescope Git files" },
        s = { "Telescope grep_string" }, -- see plugin/telescope.lua
        p = { "<cmd>e ~/.config/nvim/lua/bonryu/packer.lua<CR>]]", "edit packer.lua" },
        x = { "<cmd>!chmod +x %<CR>", "chmod +x %" },
    },
})


wk.register({
    ["<A-h>"] = { [[<cmd>lua require("tmux").move_left()<cr>]], "tmux move left" },
    ["<A-j>"] = { [[ <cmd>lua require("tmux").move_bottom()<cr> ]], "tmux move bottom" },
    ["<A-k>"] = { [[ <cmd>lua require("tmux").move_top()<cr> ]], "tmux move top" },
    ["<A-l>"] = { [[<cmd>lua require("tmux").move_right()<cr>]], "tmuxh move right" },
    ["<A-p>"] = { [[<cmd>lua require("tmux").previous_window()<cr>]], "previous window" },
    ["<A-S-h>"] = { [[<cmd>lua require("tmux").resize_left()<cr>]], "tmux resize left" },
    ["<A-S-j>"] = { [[<cmd>lua require("tmux").resize_bottom()<cr>]], "tmux resize bottom" },
    ["<A-S-k>"] = { [[<cmd>lua require("tmux").resize_top()<cr>]], "tmux resize top" },
    ["<A-S-l>"] = { [[<cmd>lua require("tmux").resize_right()<cr>]], "tmux resize right" },
})

wk.setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    -- hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "^:", "^ ", "^call ", "^lua " }, -- hide mapping boilerplate
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    spelling = {
        enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
        suggestions = 20, -- how many suggestions should be shown in the list?
    },
    presets = {
        operators = true, -- adds help for operators like d, y, ...
        motions = true, -- adds help for motions
        text_objects = true, -- help for text objects triggered after entering an operator
        windows = true, -- default bindings on <c-w>
        nav = true, -- misc bindings to work with windows
        z = true, -- bindings for folds, spelling and others prefixed with z
        g = true, -- bindings for prefixed with g
    },
}
