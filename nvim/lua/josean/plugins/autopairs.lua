local autopairs_setup, autopairs = pcall(require, "nvim-autopairs")
if not autopairs_setup then
    return
end

autopairs.setup({
    check_ts = true, -- enable treesitter
    ts_config = {
        lua = { "string" }, -- don't add pairs in lua string treesitter nodes
        javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
        java = false, -- don't check treesitter on java
    },
})

-- import nvim-cmp plugin safely
local cmp_setup, cmp = pcall(require, "cmp")
if not cmp_setup then
    return
end

