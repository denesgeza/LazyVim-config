Constants = require("config.constants")
Is_Enabled = require("config.functions").is_enabled

return {
  -- {{{ mason.nvim

  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    enabled = Is_Enabled("mason.nvim"),
    keys = { { "<leader>cm", "<cmd>Mason<cr> " } },
    opts = { ensure_installed = Constants.ensure_installed.mason },
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ nvim-treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    enabled = Is_Enabled("nvim-treesitter"),
    opts = function(_, opts)
      if Use_Defaults("nvim-treesitter") then
        -- Use LazyVim default setup.
        opts = opts
      else
        -- Use my customizations.
        opts.autopairs = { enable = true }
        opts.autotag = { enable = true, disable = { "xml" } }
        opts.context_commenting = { enable = true, enable_autocmd = false }
        opts.highlight = {
          enable = true,
          disable = Constants.disabled.treesitter,
          additional_vim_regex_highlighting = true,
        }
        opts.indent = { enable = true, disable = { "yml", "yaml" } }
        opts.rainbow = {
          enable = true,
          extended_mode = true,
          max_file_lines = 1500,
          colors = Constants.colors.rainbow,
        }
        opts.disable = { "latex" }
        opts.ensure_installed = Constants.ensure_installed.treesitter
      end
    end,

    dependencies = {
      "mrjones2014/nvim-ts-rainbow",
    },
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ nvim-lspconfig

  {
    "neovim/nvim-lspconfig",
    enabled = Is_Enabled("nvim-lspconfig"),
    event = { "BufReadPost", "BufNewFile" },
    opts = function(_, opts)
      opts.servers = {
        ansiblels = {},
        astro = {},
        bashls = {},
        clangd = {},
        cssls = {},
        denols = false,
        dockerls = {},
        gopls = {},
        html = {},
        jsonls = {},
        marksman = {},
        pyright = {},
        svelte = {},
        -- @type lspconfig.options.tsserver
        tsserver = {
          settings = {
            typescript = {
              format = {
                indentSize = vim.o.shiftwidth,
                convertTabsToSpaces = vim.o.expandtab,
                tabSize = vim.o.tabstop,
              },
            },
            javascript = {
              format = {
                indentSize = vim.o.shiftwidth,
                convertTabsToSpaces = vim.o.expandtab,
                tabSize = vim.o.tabstop,
              },
            },
            completions = {
              completeFunctionCalls = true,
            },
          },
        },
        yamlls = {},

        lua_ls = {
          single_file_support = true,
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                workspaceWord = true,
                callSnippet = "Both",
              },
              misc = {
                parameters = {
                  "--log-level=trace",
                },
              },
              diagnostics = {
                enable = false,
                groupSeverity = {
                  strong = "Warning",
                  strict = "Warning",
                },
                groupFileStatus = {
                  ["ambiguity"] = "Opened",
                  ["await"] = "Opened",
                  ["codestyle"] = "None",
                  ["duplicate"] = "Opened",
                  ["global"] = "Opened",
                  ["luadoc"] = "Opened",
                  ["redefined"] = "Opened",
                  ["strict"] = "Opened",
                  ["strong"] = "Opened",
                  ["type-check"] = "Opened",
                  ["unbalanced"] = "Opened",
                  ["unused"] = "Opened",
                },
                unusedLocalExclude = { "_*" },
              },
              format = {
                enable = false,
                defaultConfig = {
                  indent_style = "space",
                  indent_size = "2",
                  continuation_indent_size = "2",
                },
              },
            },
          },
        },

        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              procMacro = { enable = true },
              cargo = { allFeatures = true },
              checkOnSave = {
                command = "clippy",
                extraArgs = { "--no-deps" },
              },
            },
          },
        },
      }
      opts.setup = {
        tsserver = function(_, opts)
          require("lazyvim.util").on_attach(function(client, buffer)
            if client.name == "tsserver" then
            -- stylua: ignore
            vim.keymap.set("n", "<leader>co", "<cmd>TypescriptOrganizeImports<CR>", { buffer = buffer, desc = "Organize Imports" })
            -- stylua: ignore
            vim.keymap.set("n", "<leader>cR", "<cmd>TypescriptRenameFile<CR>", { desc = "Rename File", buffer = buffer })
            end
          end)
          require("typescript").setup({ server = opts })
          return true
        end,
      }
    end,
    config = function(_, opts)
      -- setup autoformat
      require("lazyvim.plugins.lsp.format").autoformat = opts.autoformat
      -- setup formatting and keymaps
      require("lazyvim.util").on_attach(function(client, buffer)
        -- require("lazyvim.plugins.lsp.format").on_attach(client, buffer)
        require("lazyvim.plugins.lsp.keymaps").on_attach(client, buffer)
      end)

      -- diagnostics
      for name, icon in pairs(require("lazyvim.config").icons.diagnostics) do
        name = "DiagnosticSign" .. name
        vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
      end
      vim.diagnostic.config(opts.diagnostics)

      local servers = opts.servers
      servers = {
        eslint = {},
      }
      local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
      -- Add folding capabilities required by ufo.nvim
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }

      local function setup(server)
        local server_opts = vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(capabilities),
        }, servers[server] or {})

        if opts.setup[server] then
          if opts.setup[server](server, server_opts) then
            return
          end
        elseif opts.setup["*"] then
          if opts.setup["*"](server, server_opts) then
            return
          end
        end
        require("lspconfig")[server].setup(server_opts)
      end

      -- temp fix for lspconfig rename
      -- https://github.com/neovim/nvim-lspconfig/pull/2439
      local mappings = require("mason-lspconfig.mappings.server")
      if not mappings.lspconfig_to_package.lua_ls then
        mappings.lspconfig_to_package.lua_ls = "lua-language-server"
        mappings.package_to_lspconfig["lua-language-server"] = "lua_ls"
      end

      local mlsp = require("mason-lspconfig")
      local available = mlsp.get_available_servers()

      local ensure_installed = {} ---@type string[]
      for server, server_opts in pairs(servers) do
        if server_opts then
          server_opts = server_opts == true and {} or server_opts
          -- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
          if server_opts.mason == false or not vim.tbl_contains(available, server) then
            setup(server)
          else
            ensure_installed[#ensure_installed + 1] = server
          end
        end
      end

      require("mason-lspconfig").setup({ ensure_installed = ensure_installed })
      require("mason-lspconfig").setup_handlers({ setup })
      require("ufo").setup()
    end,
  },

  -- ----------------------------------------------------------------------- }}}
}
