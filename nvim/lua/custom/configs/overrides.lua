local M = {}

M.treesitter = {
    ensure_installed = {
        "lua",
        "javascript",
        "jsdoc",
        "typescript",
        -- "help",
        "c",
        "cpp",
        "html",
        "python",
        "css",
        "scss",
        "json",
        "yaml",
        "regex",
        "embedded_template"
    },
    embedded_template = { enable = true, },
    highlight = {
        enable = true,
        use_languagetree = true,
    },
    indent = { enable = true },
}

M.mason = {
    ensure_installed = {
        -- lua stuff
        "lua-language-server",
        "stylua",

        -- web dev
        "css-lsp",
        "html-lsp",
        "typescript-language-server",
        -- "deno",
        "emmet-ls",
        "json-lsp",

        -- shell
        "shfmt",
        "shellcheck",
        "pyright",
    },
}

-- git support in nvimtree
M.nvimtree = {
    filters = {
        git_ignored = false,
        dotfiles = false,
    },
    disable_netrw = true,
    hijack_netrw = true,
    hijack_cursor = true,
    hijack_unnamed_buffer_when_opening = true,
    prefer_startup_root = false,
    select_prompts = false,
    sync_root_with_cwd = false,
    update_cwd = false,
    update_focused_file = {
        enable = true,
        update_root = false,
        update_cwd = false,
    },
    hijack_directories = {
        enable = true,
        auto_open = true,
    },
    view = {
        adaptive_size = false,
        side = "left",
        width = 55,
        preserve_window_proportions = true,
    },
    git = {
        enable = true,
        -- ignore = true,
    },
    filesystem_watchers = {
        enable = true,
    },
    actions = {
        open_file = {
            resize_window = true,
        },
    },
    root_dirs = {
        "/home/liamplm/.config/nvim",
    },
    renderer = {
        icons = {
            git_placement = "signcolumn",
            diagnostics_placement = "after",
            show = {
                git = true,
            },
        },
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = false,
        debounce_delay = 50,
        severity = {
            min = vim.diagnostic.severity.HINT,
            max = vim.diagnostic.severity.ERROR,
        },
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
}

return M
