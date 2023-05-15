-- :help options
-- :set
vim.g.mapleader = " "

local options = {
    -- guicursor = "",                      -- keep rectangle cursor in insert mode
    cmdheight = 1,                          -- more space in the neovim command line for displaying messages
    completeopt = {
        "menuone", "noinsert",
        "noselect", "preview",
    }, -- mostly just for cmp
    conceallevel = 0,                       -- so that `` is visible in markdonw files
    fileencoding = "utf-8",                 -- the encoding writtent to a file
    nu = true,                              -- number, nu, nonumber, nonu. Line numbering
    pumheight = 10,                         -- pop up menu height
    showmode = true,                        -- keep showing the mode
    showtabline = 2,                        -- always show tabs

    ignorecase = true,                      -- ignore case in search patterns
    smartcase = true,                       -- smart case
    smartindent = true,
    breakindent = true,
    breakindentopt = { 'shift:2' },
    wrap = true,
    linebreak = true,

    -- Splits
    splitbelow = true,                      -- force all horizontal splits to go below current window
    splitright = true,                      -- force all vertical splits to go to the right of the current window

    -- Undo tree, swap, backup related, etc.
    swapfile = false,
    undodir = os.getenv("HOME") .. "/.vim/undodir",
    undofile = true,                        -- enable persistent undo
    -- writebackup = false,                    -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

    cursorline = true,                     -- highlight the current line
    relativenumber = true,
    tabstop = 4,
    softtabstop = 4,
    shiftwidth = 4,
    expandtab = true,
    backup = false,
    hlsearch = false,                       -- don't highlight all matches of previous search
    incsearch = true,


    termguicolors = true,
    scrolloff = 8,                          -- minimal number of screen lines to keep above and below the cursor
    sidescrolloff = 8,                      -- minimal number of screen columns either side of cursor if wrap is `false`
    signcolumn = "yes",                     -- always show the sign column, otherwise it would shift the text each time
    updatetime = 50,
    colorcolumn = "80",
    guifont = "monospace:h17",              -- the font used in graphical neovim applications
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.opt.iskeyword:append "-"                -- hyphnated words recognized by searches as one word. e.g. asdf-asdf can be searched as asdfasdf
vim.opt.isfname:append "@-@"

-- vim.cmd[[ highlight SignColumn guibg=gray ]]
-- vim.cmd("highlight SignColumn guibg=darkgrey") 
-- vim.highlight = {signcolumn = { guibg = "darkgrey"} }

