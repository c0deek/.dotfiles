-- clangd-12
-- filetypes = { "c", "cpp", "objc", "objcpp" }
require'lspconfig'.clangd.setup{}

-- pyright
-- filetypes = { "python" }
require'lspconfig'.pyright.setupP{}
