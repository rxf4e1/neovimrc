local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

return {
  'neovim/nvim-lspconfig',
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    -- "j-hui/fidget.nvim",
  },
  config = function()
    local cmp = require("cmp")
    local cmp_lsp = require("cmp_nvim_lsp")
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('user-lsp-attach', { clear = true }),
      callback = function(e)
        -- local builtin = require('telescope.builtin')
        vim.keymap.set("n", "gd", ':Pick lsp scope="definition"<CR>', {desc = "Goto Definition"})
        vim.keymap.set("n", "gD", ':Pick lsp scope="type_definition"<CR>', {desc = "Goto Type Definition"})
        vim.keymap.set("n", "K", function() vim.lsp_hover() end, {desc = "Hover Documentation"})
        vim.keymap.set("n", "<leader>lw", ':Pick lsp scope="workspace_symbol"<CR>', {desc = "Workspace Symbols"})
        vim.keymap.set("n", "<leader>li", ":LspInfo<CR>", {desc = "LSP Information"})
        vim.keymap.set("n", "<leader>la", function() vim.lsp.buf.code_action() end, {desc = "Code Action"})
        vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.rename() end, {desc = "Rename"})
        vim.keymap.set("n", "<leader>lR", function() vim.lsp.buf.references() end, {desc = "Goto References"})
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, {desc = "Goto Next"})
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, {desc = "Goto Previous"})
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, {desc = "Signature Help"})
        local client = vim.lsp.get_client_by_id(e.data.client_id)
        if client and client.server_capabilities_documentHighlightProvider then
          vim.api.nvim_create_autocmd({'CursorHold', 'CursorHoldI'}, {
            buffer = e.buf,
            callback = vim.lsp.buf.clear_references,
          })
        end
      end
    })
    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      cmp_lsp.default_capabilities())
    -- require("fidget").setup {}
    require("mason").setup {}
    require("mason-lspconfig").setup {
      ensure_installed = {
        "lua_ls",
        "rust_analyzer",
        "tsserver"
      },
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup { capabilities = capabilities }
        end,
        ["lua_ls"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.lua_ls.setup {
            capabilities = capabilities,
            settings = {
              Lua = {
                diagnostics = { globals = {"vim", "it", "describe", "before_each", "after_each"} }
              }
            },
          }
        end,
      },
    }

    local cmp_select = { behavior = cmp.SelectBehavior.Select }
    local luasnip = require("luasnip")
    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body) -- For `luasnip` users.
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- that way you will only jump inside the snippet region
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' }
        })
    })

    vim.diagnostic.config({
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    })
  end,
}
