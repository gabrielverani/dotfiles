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

alias gs="git status"
alias ga="git add ."
alias gc="git commit -m"
alias gp="git push"
alias gl="git log --oneline --graph --all --decorate"
alias gco="git checkout"
alias gb="git branch"

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

# Verifica se a sessão é interativa antes de executar comandos específicos
if status is-interactive
    # Aqui podem ser adicionados comandos que rodarão apenas em sessões interativas
end

eval "$(/opt/homebrew/bin/brew shellenv)"

set -Ux OLLAMA_MODELS /Volumes/Verani-SSD/Ollama/models
set -Ux MODELS_PATH /Volumes/Verani-SSD/LocalAI/models

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# Created by `pipx` on 2025-06-02 03:47:37
set PATH $PATH /Users/verani/.local/bin

# Added by Windsurf
fish_add_path /Users/verani/.codeium/windsurf/bin
