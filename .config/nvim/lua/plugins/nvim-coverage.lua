return {
  "andythigpen/nvim-coverage",
  version = "*",
  dependencies = { "nvim-neotest/neotest-plenary", "nvim-neotest/neotest" },
  keys = {
    { "<leader>tc", "<cmd>Coverage<cr>", desc = "Coverage" },
    { "<leader>tx", "<cmd>CoverageClear<cr>", desc = "Clear Coverage" },
    { "<leader>tD", "<cmd>CoverageSummary<cr>", desc = "Show Coverage Summary" },
  },
  config = function()
    local coverage = require("coverage")
    coverage.setup({
      auto_reload = true,
      commands = true,
      auto_reload_timeout_ms = 1000,
      highlights = {
        -- customize highlight groups created by the plugin
        covered = { fg = "#C3E88D" }, -- supports style, fg, bg, sp (see :h highlight-gui)
        uncovered = { fg = "#F07178" },
      },
      signs = {
        -- use your own highlight groups or text markers
        covered = { hl = "CoverageCovered", text = "▎" },
        uncovered = { hl = "CoverageUncovered", text = "▎" },
      },
      summary = {
        -- customize the summary pop-up
        min_coverage = 100.0, -- minimum coverage threshold (used for highlighting)
      },
      lang = {
        python = {
          coverage_command = "coverage json -i -q -o -",
          coverage_file = ".coverage",
        },
      },
    })
    -- 🔹 Carregar cobertura automaticamente ao abrir arquivos Python
    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "*.py",
      callback = function()
        coverage.load(true)
        coverage.show()
      end,
    })

    -- 🔹 Recarregar cobertura ao atualizar o arquivo `.coverage`
    vim.api.nvim_create_autocmd("BufWritePost", {
      pattern = ".coverage",
      callback = function()
        coverage.load(true)
        coverage.show()
      end,
    })
  end,
}
