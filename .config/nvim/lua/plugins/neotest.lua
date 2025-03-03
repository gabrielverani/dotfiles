return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/neotest-python",
  },
  opts = function(_, opts)
    opts.adapters = opts.adapters or {}
    table.insert(
      opts.adapters,
      require("neotest-python")({
        dap = { justMyCode = false }, -- Se estiver usando DAP para depuração
        args = { "--cov=.", "--cov-append", "--cov-report=term-missing" },
      })
    )
  end,
}
