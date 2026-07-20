return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'stevearc/conform.nvim',
    { 'mason-org/mason.nvim', opts = {} },
    'mason-org/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'j-hui/fidget.nvim',
  },

  config = function()
    require('conform').setup {
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'black' }, -- Python formatters
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    }
    local cmp = require 'cmp'
    local cmp_lsp = require 'cmp_nvim_lsp'
    local capabilities = vim.tbl_deep_extend('force', {}, vim.lsp.protocol.make_client_capabilities(), cmp_lsp.default_capabilities())

    require('fidget').setup {}
    require('mason').setup()

    local servers = {
      lua_ls = {
        -- cmd = { ... },
        -- filetypes = { ... },
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = { version = 'LuaJIT' },
            completion = {
              callSnippet = 'Replace',
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file('', true),
              checkThirdParty = false,
            },
            format = {
              enable = true,
              -- Put format options here
              -- NOTE: the value should be STRING!!
              defaultConfig = {
                indent_style = 'space',
                indent_size = '2',
              },
            },
            -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
            -- diagnostics = { globals = { 'vim' } },
          },
        },
      },
      pylsp = {
        capabilities = capabilities,
        settings = {
          pylsp = {
            plugins = {
              -- Enable/disable plugins
              pycodestyle = {
                enabled = true,
                maxLineLength = 100,
              },
              -- pyflakes = { enabled = true },
              -- mccabe = { enabled = true },
              -- You can add more plugins like 'pylsp_mypy', 'pylsp_rope', etc.
              -- They must be installed separately via pip.
              -- Example:
              -- pylsp_mypy = { enabled = true },
              -- pylsp_rope = { enabled = true },
              -- Formatting: pylsp can use autopep8, yapf, or black via plugin.
              -- We'll use conform.nvim for formatting, so disable pylsp's formatting.
              -- autopep8 = { enabled = false },
              -- yapf = { enabled = false },
            },
          },
        },
      },
    }

    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      'stylua', -- Used to format Lua code
    })
    require('mason-tool-installer').setup { ensure_installed = ensure_installed }
    require('mason-lspconfig').setup {
      ensure_installed = {},
      automatic_installation = false,
    }
    vim.lsp.config('lua_ls', servers['lua_ls'])
    vim.lsp.config('pylsp', servers['pylsp'])

    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    cmp.setup {
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
      },
      mapping = cmp.mapping.preset.insert {
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-l>'] = cmp.mapping.confirm { select = true },
        ['<C-Space>'] = cmp.mapping.complete(),
      },
      sources = cmp.config.sources({
        { name = 'copilot', group_index = 2 },
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
      }, {
        { name = 'buffer' },
      }),
    }

    vim.diagnostic.config {
      -- update_in_insert = true,
      float = {
        focusable = false,
        style = 'minimal',
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
      },
    }
  end,
}
