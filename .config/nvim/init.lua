-- Detecta se está rodando dentro do VSCode
if vim.g.vscode then
  return
end

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
