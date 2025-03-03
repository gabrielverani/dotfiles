# Configuração do Fish Shell

# Desativa a mensagem padrão de boas-vindas do Fish
set -g fish_greeting ""
# Define o editor padrão como Neovim
set -Ux EDITOR nvim

# shortcuts
alias .. "cd .."
alias cd.. "cd .."
alias ll "ls -la"

# modern tooling (see https://github.com/ibraheemdev/modern-unix)
alias ls eza
alias cat bat

# typos
alias gti git
# Ativa realce de sintaxe no grep
alias grep="grep --color=auto"

# Substitui 'vi' por 'nvim' para abrir arquivos com Neovim
alias vi="nvim"

# -- INICIALIZAÇÃO DO AGENTE SSH --
# Inicia o agente SSH automaticamente se ainda não estiver ativo
if not set -q SSH_AUTH_SOCK
    ssh-agent -s | source
end

# Verifica se a sessão é interativa antes de executar comandos específicos
if status is-interactive
    # Aqui podem ser adicionados comandos que rodarão apenas em sessões interativas
end
