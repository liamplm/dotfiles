---@type MappingsTable
local M = {}

-- M.general = {
--   n = {
--     [";"] = { ":", "enter command mode", opts = { nowait = true } },
--   },
-- }
--
-- -- more keybinds!
--
-- return M
--

-- vim.cmd [[
--
-- map <C-M> :echo ddwd
-- ]]

M.disabled = {
    n = {
        ["<leader>pt"] = "",
        ["<leader>ph"] = "",
        ["<C-c>"] = "",
        ["<C-h>"] = "",
        ["<C-j>"] = "",
        ["<C-k>"] = "",
        ["<C-l>"] = "",
    }
}

M.general = {
    n = {
        ["<leader>y"] = { "\"+y", "copy to clipboard" },
        ["<leader>p"] = { "\"+p", "paste from clipboard" },
        ["<C-c>"] = {
            function()
                require("nvchad_ui.tabufline").close_buffer()
            end,
            "close buffer",
        },
    },
    v = {
        ["<leader>y"] = { "\"+y", "copy to clipboard" },
        ["<leader>p"] = { "\"+p", "paste from clipboard" },
    },
}

M.comment = {
    -- toggle comment in both modes
    n = {
        ["++"] = {
            function()
                require("Comment.api").toggle.linewise.current()
            end,
            "toggle comment",
        },
        ["<leader>/"] = {
            function()
                require("Comment.api").toggle.linewise.current()
            end,
            "toggle comment",
        },
    },

    v = {
        ["++"] = {
            "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
            "toggle comment",
        },
        ["<leader>/"] = {
            "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
            "toggle comment",
        },
    },
}

M.lspconfig = {
    -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions

    n = {
        ["gD"] = {
            function()
                vim.lsp.buf.declaration()
            end,
            "lsp declaration",
        },

        ["gd"] = {
            function()
                vim.lsp.buf.definition()
            end,
            "lsp definition",
        },

        ["K"] = {
            function()
                vim.lsp.buf.hover()
            end,
            "lsp hover",
        },

        ["gi"] = {
            function()
                vim.lsp.buf.implementation()
            end,
            "lsp implementation",
        },

        ["<leader>ls"] = {
            function()
                vim.lsp.buf.signature_help()
            end,
            "lsp signature_help",
        },

        ["<leader>D"] = {
            function()
                vim.lsp.buf.type_definition()
            end,
            "lsp definition type",
        },

        ["gr"] = {
            function()
                require("nvchad.renamer").open()
            end,
            "lsp rename",
        },

        ["<leader>ca"] = {
            function()
                vim.lsp.buf.code_action()
            end,
            "lsp code_action",
        },

        ["gR"] = {
            function()
                vim.lsp.buf.references()
            end,
            "lsp references",
        },

        ["<leader>f"] = {
            function()
                vim.diagnostic.open_float()
            end,
            "floating diagnostic",
        },

        ["[d"] = {
            function()
                vim.diagnostic.goto_prev()
            end,
            "goto prev",
        },

        ["d]"] = {
            function()
                vim.diagnostic.goto_next()
            end,
            "goto_next",
        },

        ["<leader>q"] = {
            function()
                vim.diagnostic.setloclist()
            end,
            "diagnostic setloclist",
        },

        ["<leader>fm"] = {
            function()
                vim.lsp.buf.format { async = true }
            end,
            "lsp formatting",
        },

        ["<leader>wa"] = {
            function()
                vim.lsp.buf.add_workspace_folder()
            end,
            "add workspace folder",
        },

        ["<leader>wr"] = {
            function()
                vim.lsp.buf.remove_workspace_folder()
            end,
            "remove workspace folder",
        },

        ["<leader>wl"] = {
            function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end,
            "list workspace folders",
        },
    },
}

M.telescope = {

    n = {
        -- find
        ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "find files" },
        ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "find all" },
        ["<leader>fw"] = { '<cmd> :lua require"telescope.builtin".live_grep{ search_dirs={"."} } <CR>', "live grep" },
        ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "find buffers" },
        ["<leader><space>"] = { "<cmd> Telescope resume <CR>", "resume telescope" },
        ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "help page" },
        ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "find oldfiles" },
        ["<leader>tk"] = { "<cmd> Telescope keymaps <CR>", "show keys" },

        -- git
        ["<leader>gc"] = { "<cmd> Telescope git_commits <CR>", "git commits" },
        ["<leader>gs"] = { "<cmd> Telescope git_status <CR>", "git status" },

        -- pick a hidden term
        ["<leader>ht"] = { "<cmd> Telescope terms <CR>", "pick hidden term" },

        -- theme switcher
        ["<leader>th"] = { "<cmd> Telescope themes <CR>", "nvchad themes" },
    },
}


M.gitsigns = {
    n = {
        -- Navigation through hunks
        ["]c"] = {
            function()
                if vim.wo.diff then
                    return "]c"
                end
                vim.schedule(function()
                    require("gitsigns").next_hunk()
                end)
                return "<Ignore>"
            end,
            "Jump to next hunk",
            opts = { expr = true },
        },

        ["[c"] = {
            function()
                if vim.wo.diff then
                    return "[c"
                end
                vim.schedule(function()
                    require("gitsigns").prev_hunk()
                end)
                return "<Ignore>"
            end,
            "Jump to prev hunk",
            opts = { expr = true },
        },

        -- Actions
        ["<leader>rh"] = {
            function()
                require("gitsigns").reset_hunk()
            end,
            "Reset hunk",
        },

        ["<leader>R"] = {
            function()
                require("gitsigns").preview_hunk()
            end,
            "Preview hunk",
        },

        ["<leader>gb"] = {
            function()
                package.loaded.gitsigns.blame_line()
            end,
            "Blame line",
        },

        ["<leader>td"] = {
            function()
                require("gitsigns").toggle_deleted()
            end,
            "Toggle deleted",
        },
    },
}

M.whichkey = {
  n = {
    ["<leader>wk"] = {
      function()
        vim.cmd "WhichKey"
      end,
      "Which-key all keymaps",
    },
    ["<leader>wK"] = {
      function()
        local input = vim.fn.input "WhichKey: "
        vim.cmd("WhichKey " .. input)
      end,
      "Which-key query lookup",
    },
  },
}

return M
