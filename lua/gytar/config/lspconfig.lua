local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- this function is used to show differents options from lsp
local on_attach = function(client, bufnr)
  opts.buffer = bufnr

  -- set keybinding
  opts.desc = "Show LSP references"
  keymap.set('n', 'gR', '<cmd>Telescope lsp_references<CR>' , opts)

  opts.desc = "Go to declarations"
  keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)

  opts.desc = "Show LSP definitions"
  keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts)

  opts.desc = "Show LSP implementations"
  keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts)

  opts.desc = "Show LSP type definitions"
  keymap.set('n', 'gt', '<cmd>Telescope lsp_type_definitions<CR>', opts)

  opts.desc = "See available code actions"
  keymap.set({ 'n', 'v' }, '<leader>ga', vim.lsp.buf.code_action, opts)

  opts.desc = "Smart rename"
  keymap.set('n', "<leader>rn", vim.lsp.buf.rename, opts)

  opts.desc = "Show buffer diagnostics"
  keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

  opts.desc = "Show line diagnostics"
  keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

  opts.desc = "Go to previous diagnostic"
  keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

  opts.desc = "Go to next diagnostic"
  keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

  opts.desc = "Show documentation for what is under cursor"
  keymap.set("n", "K", vim.lsp.buf.hover, opts)

  opts.desc = "Restart LSP"
  keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)

end

-- Change the Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
for error_type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. error_type
  vim.fn.sign_define(hl, { text = icon, texhl = hl, numhl = "" })
end

-- configure lspconfig servers
local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig["pyright"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["lua_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})
lspconfig["bashls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})
lspconfig.gopls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
            gofumpt = true,
        },
    },
})
