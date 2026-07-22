# dotfiles

Personal Linux configuration for a CachyOS/i3 desktop. This repository is intentionally curated: it contains portable preferences and scripts, not a copy of the entire home directory.

## Included

- Bash, Zsh, Fish, profile, tmux, and Vim configuration
- Alacritty and Kitty terminal configuration
- i3, Polybar, Picom, Dunst, Rofi, and GTK configuration
- btop, Fastfetch, Micro, and Zathura configuration
- i3 wallpaper and small desktop helper scripts

The exact managed paths are listed in [`manifest.txt`](manifest.txt).

## Install

Clone the repository, review the files, then run:

```bash
git clone https://github.com/ducchinhpro123/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

The installer creates symlinks from the home directory into the repository. Existing files are moved to a timestamped directory under `~/.local/state/dotfiles-backups/`; they are never deleted.

## Machine-specific assumptions

- The shell files source CachyOS defaults from `/usr/share`.
- The i3/Polybar setup expects displays named `DP-2` and `HDMI-0`.
- The typing-speed Polybar module expects a keyboard named `Keyboard K380 Keyboard`.
- Several configs expect locally installed fonts and tools, including Hack, Iosevka Nerd Font Mono, Fira Sans, tmux TPM, Rofi, Polybar, Picom, Dunst, `feh`, `playerctl`, `pamixer`, `xob`, `checkupdates`, and `paru`.
- The weather script contains no API key; configure one locally if that module is used.

## Security

Credentials, private/public SSH keys, histories, browser profiles, VPN state, caches, logs, session databases, backups, and generated runtime data are excluded. Keep secrets out of tracked files even though the GitHub repository is private.
