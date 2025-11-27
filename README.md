# Personal Configurations

This repository keeps my daily driver dotfiles so they travel with me between macOS and Linux machines. Files are tracked *as-is* so I can symlink them back into `$HOME` or apply them with a dotfile manager.

## Contents

| Path | Description |
| --- | --- |
| `.zshrc` | Shell configuration with PATH setup, aliases, NVM, zoxide, and powerlevel10k. |
| `.vimrc` | Minimal Vim bootstrap that enables syntax highlighting and sensible defaults. |
| `.gitconfig` | Git identity (name/email) used across environments. |
| `.config/kitty/kitty.conf` | Primary Kitty terminal configuration (fonts, opacity, keybindings, theme include). |
| `.config/kitty/current-theme.conf` | Gruvbox Dark Soft palette referenced by Kitty. |

## Usage

1. Clone the repo next to your other projects:
   ```bash
   git clone git@github.com:enzobl/configs.git ~/repos/configs
   ```
2. Back up any existing local dotfiles.
3. Symlink the files from this repo into `$HOME` (example with GNU Stow):
   ```bash
   cd ~/repos/configs
   stow --target=$HOME .
   ```
4. Restart your shell (or Kitty/Vim) to pick up the new configuration.

## Updating

- Edit the files directly in this repo (not in `$HOME`).
- Run `stow --restow .` after changes to refresh symlinks.
- Commit the updates with a meaningful message so history stays useful.

