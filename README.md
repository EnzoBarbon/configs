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

## Updating

- Edit the files directly in this repo (not in `$HOME`).
- Run `stow --restow .` after changes to refresh symlinks.
- Commit the updates with a meaningful message so history stays useful.
