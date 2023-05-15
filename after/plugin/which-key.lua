local status_ok, wk = pcall(require, "which-key")
if not status_ok then
    return
end

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
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- Stay in indent mode
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
local noprefixmappings_visualmode = {
    ["J"] = { "move lines down in visual mode" },
    ["K"] = { "Move lines up in visual mode" },
    ["<"] = { "<gv", "Indent Left and Stay in indent mode"},
    [">"] = { ">gv", "Indent Right and Stay in indent mode"},
}
wk.register { noprefixmappings_visualmode, { mode = "v" } }

local noprefixmappings_normalmode = {
    ["J"] = { "mzJ`z", "leaves cursor in place when joining lines" },
    ["<S-l>"] = { ":bnext<CR>", "next buffer" },
    ["<S-h>"] = { ":bprevious<CR>", "previous buffer" },
    ["<A-p>"] = { "<C-w>p", "go to previous window" },
    ["<C-d>"] = { "<C-d>zz", "half page jump down in place"},
    ["<C-u>"] = { "<C-u>zz", "half page jump up in place"},
    ["n"] = { "nzzzv", "nzzzv search and found terms stay in middle" },
    ["N"] = { "Nzzzv", "Nzzzv search and found terms stay in middle" },

}
wk.register { noprefixmappings_normalmode, { mode = "n" } }


