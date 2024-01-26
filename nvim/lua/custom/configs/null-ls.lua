local null_ls = require "null-ls"

local b = null_ls.builtins

local sources = {

    -- webdev stuff
    -- b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!

    b.formatting.prettierd.with {
        filetypes = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "vue",
            "css",
            "scss",
            "html",
            "markdown",
            "css",
        },
    }, -- so prettier works only on these filetypes

    -- Lua
    b.formatting.stylua,

    -- cpp
    b.formatting.clang_format,
    -- offsetEncoding = { "utf-8", "utf-16" },
}

null_ls.setup {
    debug = true,
    sources = sources,
    on_init = function(new_client, _)
        new_client.offset_encoding = "utf-32"
    end,
    -- offsetEncoding = { "utf-8", "utf-16" },
}
