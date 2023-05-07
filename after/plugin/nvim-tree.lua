local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
    return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

local function my_on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)

  -- vim.keymap.set('n', 'O', '', { buffer = bufnr })
  -- vim.keymap.del('n', 'O', { buffer = bufnr })
  -- vim.keymap.set('n', '<2-RightMouse>', '', { buffer = bufnr })
  -- vim.keymap.del('n', '<2-RightMouse>', { buffer = bufnr })
  -- vim.keymap.set('n', 'D', '', { buffer = bufnr })
  -- vim.keymap.del('n', 'D', { buffer = bufnr })
  -- vim.keymap.set('n', 'E', '', { buffer = bufnr })
  -- vim.keymap.del('n', 'E', { buffer = bufnr })

  vim.keymap.set('n', 'l',  api.node.open.edit, opts('Open'))
  vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))

  vim.keymap.set('n', 'A', api.tree.expand_all, opts('Expand All'))
  vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
  vim.keymap.set('n', 'C', api.tree.change_root_to_node, opts('CD'))


  vim.keymap.set('n', 'P', function()
    local node = api.tree.get_node_under_cursor()
    print(node.absolute_path)
  end, opts('Print Node Path'))

  vim.keymap.set('n', 'Z', api.node.run.system, opts('Run System'))

end

nvim_tree.setup {
    on_attach = my_on_attach,
    disable_netrw = false,
    hijack_netrw = true,
    open_on_tab = true,
    sync_root_with_cwd = false,

    actions = {
        change_dir = {
          enable = true,
          global = false,
          restrict_above_cwd = false,
        },
    },
    update_focused_file = {
        enable = true,
        update_root = true,
    },
    renderer = {
        root_folder_modifier = ":t",
        icons = {
            glyphs = {
                default = "",
                symlink = "",
                folder = {
                    arrow_open = "",
                    arrow_closed = "",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                },
                git = {
                    unstaged = "",
                    staged = "S",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "U",
                    deleted = "",
                    ignored = "◌",
                },
            },
        },
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    view = {
        width = 30,
        side = "left",
        mappings = {
            list = {
                --{ key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
                { key = "h",                  cb = tree_cb "close_node" },
                { key = "v",                  cb = tree_cb "vsplit" },
            },
        },
    },
    git = {
        enable = true,
        ignore = false,
        show_on_dirs = true,
        show_on_open_dirs = true,
        timeout = 400,
    },
}


-- local function open_nvim_tree(data)
--     -- buffer is a directory
--     local directory = vim.fn.isdirectory(data.file) == 1
-- 
--     if not directory then
--         return
--     end
-- 
--     -- Uncomment below lines to open a new buffer by default besides nvimtree
--     -- create a new, empty buffer
--     vim.cmd.enew()
-- 
--     -- wipe the directory buffer
--     vim.cmd.bw(data.buf)
-- 
--     -- change to the directory
--     vim.cmd.cd(data.file)
-- 
--     -- open the tree
--     require("nvim-tree.api").tree.open()
-- end
-- 
-- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

