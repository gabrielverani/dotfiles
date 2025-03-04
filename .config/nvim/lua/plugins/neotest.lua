return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/neotest-python",
  },
  opts = {
    adapters = {
      ["neotest-python"] = {
        runner = "pytest",
        args = { "--cov", ".", "--cov-report", "term-missing" },
      },
    },
  },
}
