-- lua/plugins/lsp.lua
return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "mason-org/mason.nvim", config = true },
      { "williamboman/mason-lspconfig.nvim" },
    },
    config = function()
      local ok_mason, mason = pcall(require, "mason")
      local ok_mlsp, mason_lsp = pcall(require, "mason-lspconfig")
      -- ВАЖНО: не require("lspconfig")!
      local util   = require("lspconfig.util")
      local configs = require("lspconfig.configs")

      if ok_mason then mason.setup() end
      if ok_mlsp then
        mason_lsp.setup({
          ensure_installed = {
            "pyright",
            "ruff",
            "rust_analyzer",
            "clangd",
            "denols",
            "ts_ls",
            "html",
            "cssls",
            "jdtls",
          },
          automatic_installation = false,
        })
      end

      -- ===== capabilities =====
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument = capabilities.textDocument or {}
      capabilities.textDocument.completion = capabilities.textDocument.completion or {}
      capabilities.textDocument.completion.completionItem =
        capabilities.textDocument.completion.completionItem or {}
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      -- Расширим capabilities возможностями cmp, если доступен cmp_nvim_lsp
      pcall(function()
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
      end)

      -- ===== helpers =====
      local function no_format_on_attach(client, _)
        if client.server_capabilities then
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end
      end

      local function disable_diagnostics_for(client)
        client.handlers["textDocument/publishDiagnostics"] = function() end
      end

      local function cmd_exists(cmd)
        return vim.fn.executable(cmd) == 1
      end

      local function resolve_ty_base_cmd()
        if cmd_exists("ty") then
          return { "ty", "server" }
        elseif cmd_exists("uvx") then
          return { "uvx", "ty", "server" }
        else
          return nil
        end
      end

      local function detect_venv(root)
        local candidates = { ".venv", "venv", "env", ".env" }
        for _, name in ipairs(candidates) do
          local p = util.path.join(root, name)
          if util.path.is_dir(p) then
            return p
          end
        end
        return nil
      end

      -- ===== Общий on_attach через автокоманду LspAttach =====
      local augroup = vim.api.nvim_create_augroup("UserLspAttach", {})
      vim.api.nvim_create_autocmd("LspAttach", {
        group = augroup,
        callback = function(ev)
          local client = vim.lsp.get_client_by_id(ev.data.client_id)
          local bufnr = ev.buf

          -- применяем твою логику запрета форматтера, если надо
          if client and client.name then
            if client.name == "pyright"
              or client.name == "ruff"
              or client.name == "rust_analyzer"
              or client.name == "clangd"
              or client.name == "denols"
              or client.name == "ts_ls"
              or client.name == "html"
              or client.name == "cssls"
            then
              no_format_on_attach(client, bufnr)
            end
          end

          -- сюда можно повесить общие keymaps:
          -- local function bufmap(mode, lhs, rhs, desc)
          --   vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
          -- end
          -- bufmap("n", "gd", vim.lsp.buf.definition, "LSP Go to Definition")
        end,
      })

      -- ===== Регистрируем кастомный сервер ty через configs =====
      if not configs.ty then
        configs.ty = {
          default_config = {
            cmd = { "ty", "server" },
            filetypes = { "python" },
            root_dir = util.root_pattern(
              "pyproject.toml",
              "setup.py",
              "setup.cfg",
              "requirements.txt",
              ".git"
            ),
            single_file_support = true,
          },
        }
      end

      ------------------------------------------------------------------
      --                РЕГИСТРАЦИЯ СЕРВЕРОВ ЧЕРЕЗ vim.lsp.config
      ------------------------------------------------------------------
      local enabled = {}

      -- ===== Pyright (без диагностик) =====
      vim.lsp.config("pyright", {
        capabilities = capabilities,
        root_dir = util.root_pattern(
          "pyproject.toml",
          "alembic.ini",
          "setup.py",
          "requirements.txt",
          ".git"
        ),
        on_new_config = function(new_config, root_dir)
          local venv = detect_venv(root_dir)
          if not venv then
            local env_ve = vim.fn.getenv("VIRTUAL_ENV")
            if env_ve and #env_ve > 0 and util.path.is_dir(env_ve) then
              venv = env_ve
            end
          end

          if venv then
            local py = util.path.join(venv, "bin", "python")
            if py and util.path.is_file(py) then
              new_config.settings = new_config.settings or {}
              new_config.settings.python = new_config.settings.python or {}
              new_config.settings.python.pythonPath = py
            end
          end
        end,
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "off",
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              diagnosticMode = "openFilesOnly",
            },
          },
        },
        -- отключим диагностику для pyright (отдадим её ty)
        on_attach = function(client, bufnr)
          no_format_on_attach(client, bufnr)
          disable_diagnostics_for(client)
        end,
      })
      table.insert(enabled, "pyright")

      -- ===== ty (тип-чекер) =====
      vim.lsp.config("ty", {
        capabilities = capabilities,
        on_new_config = function(new_config, root_dir)
          local base = resolve_ty_base_cmd()
          if not base then
            vim.schedule(function()
              vim.notify(
                "Не найден ty/uvx: установи `uv tool install ty` и добавь ~/.local/bin в PATH",
                vim.log.levels.ERROR
              )
            end)
            return
          end

          new_config.cmd = base

          local venv = detect_venv(root_dir)
          if not venv then
            local env_ve = vim.fn.getenv("VIRTUAL_ENV")
            if env_ve and #env_ve > 0 and util.path.is_dir(env_ve) then
              venv = env_ve
            end
          end

          if venv then
            new_config.cmd_env = new_config.cmd_env or {}
            new_config.cmd_env.VIRTUAL_ENV = venv
          end
        end,
      })
      table.insert(enabled, "ty")

      -- ===== Ruff =====
      vim.lsp.config("ruff", {
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          no_format_on_attach(client, bufnr)
        end,
      })
      table.insert(enabled, "ruff")

      -- ===== Rust =====
      vim.lsp.config("rust_analyzer", {
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          no_format_on_attach(client, bufnr)
        end,
      })
      table.insert(enabled, "rust_analyzer")

      -- ===== C/C++ (clangd) =====
      vim.lsp.config("clangd", {
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          no_format_on_attach(client, bufnr)
        end,
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--completion-style=detailed",
          "--header-insertion=iwyu",
        },
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
        root_dir = util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
      })
      table.insert(enabled, "clangd")

      -- ===== Deno =====
      vim.lsp.config("denols", {
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          no_format_on_attach(client, bufnr)
        end,
        root_dir = util.root_pattern("deno.json", "deno.jsonc"),
        init_options = {
          lint = true,
          unstable = true,
          suggest = { imports = { hosts = { ["https://deno.land"] = true } } },
        },
      })
      table.insert(enabled, "denols")

      -- ===== TypeScript / JavaScript =====
      vim.lsp.config("ts_ls", {
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          no_format_on_attach(client, bufnr)
        end,
        root_dir = util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
        single_file_support = false,
      })
      table.insert(enabled, "ts_ls")

      -- ===== HTML =====
      vim.lsp.config("html", {
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          no_format_on_attach(client, bufnr)
        end,
        filetypes = { "html", "htmldjango", "handlebars", "twig", "templ", "astro" },
        init_options = { provideFormatter = false },
      })
      table.insert(enabled, "html")

      -- ===== CSS =====
      vim.lsp.config("cssls", {
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          no_format_on_attach(client, bufnr)
        end,
        settings = {
          css = { validate = true },
          less = { validate = true },
          scss = { validate = true },
        },
      })
      table.insert(enabled, "cssls")

      -- JAVA: управляется через плагин nvim-jdtls (см. lua/plugins/jdtls.lua)

      ------------------------------------------------------------------
      --                    ВКЛЮЧАЕМ ВСЕ СЕРВЕРА
      ------------------------------------------------------------------
      vim.lsp.enable(enabled)

      -- ===== Диагностика Neovim =====
      vim.diagnostic.config({
        virtual_text = { prefix = "●", spacing = 4 },
        signs = true,
        underline = true,
        update_in_insert = false,
      })

      pcall(vim.lsp.set_log_level, "ERROR")
    end,
  },
}
