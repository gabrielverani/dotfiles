
# 🚀 Meu Setup de Dotfiles

Este repositório contém meus **dotfiles** e um **script de instalação automatizado** para configurar meu ambiente de desenvolvimento em **macOS e Linux**.

## 📌 Recursos
✅ Instalação modular baseada em **scripts separados**  
✅ **Detecta automaticamente** o sistema operacional e a distribuição Linux  
✅ **Instalação via GitHub** sem necessidade de clonar manualmente  
✅ Configuração do **Fish, Fisher, tmux, Neovim, ferramentas CLI, Docker, Node.js e muito mais**  
✅ Gerenciamento dos **dotfiles com Git Bare Repository**  

---

## 🚀 **Instalação Direta do GitHub**
Você pode configurar seu ambiente rodando um único comando:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/gabrielverani/dotfiles/main/.dotfiles/install.sh)
```

Ou, se preferir `wget`:

```bash
bash <(wget -qO- https://raw.githubusercontent.com/gabrielverani/dotfiles/main/.dotfiles/install.sh)
```

Isso irá:
1. Baixar e executar o **`install.sh`** diretamente do GitHub.
2. Detectar o **sistema operacional e a distribuição** (se for Linux).
3. Instalar os pacotes e configurar seu ambiente automaticamente.

---

## 📦 **O que será instalado**
### **1️⃣ Homebrew (Se aplicável)**
- Instalado apenas em **macOS** ou em distribuições Linux compatíveis.
- Gerencia pacotes de forma simples.

### **2️⃣ Shell e Plugins**
- Instalação do **Fish Shell** e configuração como padrão.
- Instalação do **Fisher** e **plugins úteis**.

### **3️⃣ Ferramentas Essenciais**
- `git`, `tmux`, `fzf`, `ripgrep`, `bat`, `exa`, `tree` e muito mais.

### **4️⃣ Ferramentas de Desenvolvimento**
- `python3`, `pip`, `nodejs`, `docker`.

### **5️⃣ Dotfiles**
- Configuração do **Git Bare Repository** para versionar os arquivos de configuração do sistema.

---

## 🔄 **Atualizando o Setup**
Se você já tem o setup instalado e deseja **atualizar os dotfiles**, basta rodar:

```bash
dotfiles pull
```

Para atualizar os pacotes do sistema, execute:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/gabrielverani/dotfiles/main/.dotfiles/install.sh)
```

---

## 📂 **Estrutura do Repositório**
```
.dotfiles/
│── install.sh          # Script principal
│── install.d/          # Diretório com módulos de instalação
│   ├── 00-os.sh        # Detecta e exporta o SO/Distro
│   ├── 10-brew.sh      # Instalação do Homebrew (se aplicável)
│   ├── 20-shell.sh     # Instalação do Fish e Fisher
│   ├── 30-tools.sh     # Instalação de ferramentas essenciais
│   ├── 40-dev.sh       # Instalação de ferramentas para desenvolvimento
│   ├── 50-dotfiles.sh  # Configuração do Git Bare Repository
```

---

## 🛠 **Personalização**
Se quiser modificar quais pacotes são instalados, basta editar os arquivos dentro de **`install.d/`**.

Por exemplo, para adicionar um novo pacote à instalação de ferramentas, edite **`install.d/30-tools.sh`**:

```bash
TOOLS=(
    git
    tmux
    fzf
    ripgrep
    bat
    exa
    tree
    htop   # Adicionado manualmente
)
```

---

## 🛑 **Removendo o Setup**
Se desejar remover o setup, execute:

```bash
rm -rf ~/.dotfiles
```

E remova as configurações do shell:

```bash
rm -rf ~/.config/fish
chsh -s /bin/bash  # Restaura o shell padrão
```

---

## 📜 **Licença**
Este projeto é de uso pessoal, mas fique à vontade para clonar e modificar conforme sua necessidade.

---

🚀 **Agora seu ambiente pode ser configurado automaticamente em qualquer máquina!**  
Caso precise de ajustes, sinta-se à vontade para modificar os scripts dentro de `install.d/`. 🔥

