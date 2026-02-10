return {
  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local ok, jdtls = pcall(require, "jdtls")
      if not ok then return end

      local util = require("lspconfig.util")

      -- Определяем корень проекта
      local root_dir = util.root_pattern("gradlew", "mvnw", "pom.xml", "build.gradle", ".git")(vim.fn.getcwd())
        or vim.fn.getcwd()

      -- Пути Mason/jdtls
      local data_path = vim.fn.stdpath("data")
      local mason_path = data_path .. "/mason"
      local jdtls_bin = mason_path .. "/bin/jdtls"
      if vim.fn.executable(jdtls_bin) ~= 1 then
        jdtls_bin = "jdtls" -- fallback на PATH
      end

      -- Конфигурация для конкретной ОС
      local sys = (vim.uv or vim.loop).os_uname().sysname
      local os_config = (sys == "Darwin") and "config_mac" or ((sys == "Linux") and "config_linux" or "config_linux")

      -- Отдельный workspace на проект
      local workspace_dir = data_path .. "/jdtls-workspace/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

      -- LSP capabilities (с учётом nvim-cmp)
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local ok_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      if ok_cmp then
        capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
      end

      local function no_format_on_attach(client)
        if client.server_capabilities then
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end
      end

      local config = {
        cmd = {
          jdtls_bin,
          "-configuration", mason_path .. "/packages/jdtls/" .. os_config,
          "-data", workspace_dir,
        },
        root_dir = root_dir,
        capabilities = capabilities,
        flags = { allow_incremental_sync = true },
        on_attach = function(client, bufnr)
          no_format_on_attach(client)
        end,
      }

      jdtls.start_or_attach(config)
    end,
  },
}

