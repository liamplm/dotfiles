local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
-- local servers = { "html", "cssls", "tsserver", "clangd" }
local servers = { "tsserver", "html", "cssls", "pyright", "angularls", "emmet_ls"}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end


-- local utils = require "core.utils"
-- local on_attach = function(client, bufnr)
--   utils.load_mappings("lspconfig", { buffer = bufnr })
--
--   if client.server_capabilities.signatureHelpProvider then
--     require("nvchad_ui.signature").setup(client)
--   end
-- end
-- local capabilities = require("plugins.configs.lspconfig").capabilities

-- local lspconfig = require "lspconfig"
-- local servers = { "html", "cssls", "clangd"}



for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.angularls.setup {}

lspconfig.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,

  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
}

local util = require "lspconfig.util"
local server_config = {
    filetypes = { "ino", "c", "cpp", "h", "hpp", "objc", "objcpp", "opencl" },
    root_dir = function(fname)
        return util.root_pattern(".ccls")(fname)
            or util.root_pattern(".ccls", "compile_commands.json", "compile_flags.txt")(fname)
            or util.root_pattern("main.cpp")(fname)
            or util.find_git_ancestor(fname)
    --     return util.root_pattern("compile_commands.json", "compile_flags.txt", ".git")(fname)
    --         or util.find_git_ancestor(fname)
    end,
    init_options = { cache = {
        directory = "/home/liamplm/.cache/ccls/",
        -- vim.fs.normalize "~/.cache/ccls" -- if on nvim 0.8 or higher
    } },
    on_attach = on_attach,
    capabilities = capabilities,
}
require("ccls").setup { lsp = { lspconfig = server_config } }

-- 
-- lspconfig.pyright.setup { blabla}