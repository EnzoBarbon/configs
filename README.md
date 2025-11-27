# Personal Configurations

This repository keeps my daily driver dotfiles so they travel with me between macOS and Linux machines. Files are tracked _as-is_ so I can symlink them back into `$HOME` or apply them with a dotfile manager.

## Modular Layout

Each subfolder is a self-contained Stow module so you can install only what you need:

| Module   | Installs                     | Notes                                                                         |
| -------- | ---------------------------- | ----------------------------------------------------------------------------- |
| `zsh/`   | `~/.zshrc`                   | Shell configuration with PATH setup, aliases, NVM, zoxide, and powerlevel10k. |
| `vim/`   | `~/.vimrc`                   | Minimal Vim bootstrap that enables syntax highlighting and sensible defaults. |
| `git/`   | `~/.gitconfig`               | Git identity (name/email) used across environments.                           |
| `kitty/` | `~/.config/kitty/kitty.conf` | Kitty terminal configuration (fonts, opacity, keybindings, theme include).    |

## Usage

1. Clone the repo next to your other projects:
   ```bash
   git clone git@github.com:enzobl/configs.git ~/repos/configs
   ```
2. Back up any existing local dotfiles.
3. Symlink the files from this repo into `$HOME` (example with GNU Stow):
   ```bash
   cd ~/repos/configs
   # install everything
   stow --target=$HOME */
   # or pick specific modules
   stow --target=$HOME zsh git
   ```
4. Restart your shell (or Kitty/Vim) to pick up the new configuration.

## Dependencies

Below is a complete list of the tools, plugins, and utilities I install on macOS and Fedora when using these dotfiles.

### 1. Shell + Terminal Environment

- **Zsh** — main shell on macOS and Fedora.
- **Oh My Zsh** — plugin/theme framework.
  ```
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  ```
- **Powerlevel10k** — fast prompt with rich status.
  ```
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
    ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
  ```
- **zsh-autosuggestions** — ghost-text suggestions.
  ```
  git clone https://github.com/zsh-users/zsh-autosuggestions \
    ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  ```
- **zsh-syntax-highlighting** — inline syntax colors.
  ```
  git clone https://github.com/zsh-users/zsh-syntax-highlighting \
    ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  ```
- **zsh-completions** — extra completions.
  ```
  git clone https://github.com/zsh-users/zsh-completions \
    ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-completions
  ```

### 2. Terminal Utilities

- **fzf** — fuzzy finder.
  ```
  brew install fzf        # macOS
  sudo dnf install fzf    # Fedora
  ```
- **ripgrep (rg)** — fast text search.
  ```
  brew install ripgrep
  sudo dnf install ripgrep
  ```
- **zoxide** — smarter `cd`.
  ```
  brew install zoxide
  sudo dnf install zoxide
  ```
- **stow** — symlink manager used here.
  ```
  brew install stow
  sudo dnf install stow
  ```

### 3. Terminal Emulator

- **Kitty** — GPU-accelerated terminal with tabs/splits.
  ```
  brew install --cask kitty
  sudo dnf install kitty
  ```

## Updating

- Edit the files directly in this repo (not in `$HOME`).
- Run `stow --restow .` after changes to refresh symlinks.
- Commit the updates with a meaningful message so history stays useful.
