# Configuração do Fish Shell

# Desativa a mensagem padrão de boas-vindas do Fish
set -U fish_autosuggestion_enabled 1
set -U fish_history_save true
set -g fish_greeting ""
set -U fish_suggest
set -U fzf_preview_dir_cmd "eza --tree"

# Define o editor padrão como Neovim
set -Ux EDITOR nvim

bind \cf _fzf_search_directory
bind -M insert \cf _fzf_search_directory

# shortcuts
alias .. "cd .."
alias cd.. "cd .."
alias ll "ls -la"

alias ai='gh copilot suggest'
alias gpt='openai api completions.create -m gpt-4'
alias llm='ollama run mistral'
# modern tooling (see https://github.com/ibraheemdev/modern-unix)o
# Substituir ls pelo eza com ícones e ordenação por diretórios primeiro
alias ls="eza --icons --group-directories-first"

# Listagem detalhada
alias ll="eza -lah --icons --group-directories-first"

# Mostrar permissões de arquivos e usuários
alias la="eza -l --icons --group-directories-first --git --time-style=long-iso"

# Listar arquivos em árvore
alias lt="eza --tree --icons --level=2"

# Mostrar arquivos Python com permissões e timestamps
alias lpy="eza -lh --icons --time-style=long-iso --git --ext py"

# Mostrar arquivos JSON e TOML formatados
alias lconf="eza -lh --icons --time-style=long-iso --git --ext json --ext toml"

# Listagem de arquivos Git ignorados
alias lgit="eza -lah --icons --group-directories-first --git-ignore"
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
