local mason_status, mason = pcall(require, "mason")
if not mason_status then
    return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
    return
end

mason.setup()

mason_lspconfig.setup({
    ensure_installed = {
        "tsserver",
        -- "gopls",
        "html",
        "biome",
        -- "java_language_server",
        "autotools_ls",
        "pylyzer",
        "pyright",
        "ruff",
        "rust_analyzer",
        "lua_ls",
        "clangd",
        "golangci_lint_ls",
        "gopls",
    }
})

require("mason-lspconfig").setup_handlers {
    function(server_name) 
        require("lspconfig")[server_name].setup({})
    end,
}

require("lspconfig").clangd.setup({
    cmd = {
        "/usr/bin/clangd-12",
        "--header-insertion=never",
        "--clang-tidy",
        "--enable-config",
        "-I/usr/include",
        "-I/home/hope/workspace/atcoder_2/cpp/ac-library",
    }
})
require("lspconfig").gopls.setup({})

require("lspconfig").ruff.setup({})
require("lspconfig").pyright.setup({
    filetypes = { "python" },
    root_dir = require("lspconfig/util").root_pattern(".venv"),
    cmd = {
        "bash",
        "-c",
        "source .venv/bin/activate && pyright-langserver --stdio"
    }
})
require("lspconfig").lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
})

require("lspconfig").rust_analyzer.setup({})

local keymap = vim.keymap

-- enable keybinds for available lsp server
local on_attach = function(cliend, bufnr)
end

