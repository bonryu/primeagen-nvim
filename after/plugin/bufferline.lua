vim.opt.termguicolors = true
require("bufferline").setup {
    options = {
        -- offsets = {
        --     {
        --         filetype = "NvimTree",
        --         text = "NvimTree",
        --         text_align = "center", -- "left" | "center" | "right"
        --         separator = false,
        --     }
        -- },
        max_name_length = 30,
        max_prefix_length = 30, -- prefix used when a buffer is de-deuplicated
        tab_size = 10,
    }
}
